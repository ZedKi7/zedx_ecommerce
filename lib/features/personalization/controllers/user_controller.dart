import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../authentication/models/user_model.dart';
import '../../authentication/screens/login/login.dart';
import '../screens/profile/re_auth_user_login.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (_) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Function to save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First update Rx user and then check if user data is already stored, if not store new data
      await fetchUserRecord();
      // If no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert Name to First and Last Name
          final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

          // Map Data
          final newUser = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // Save user data
          await userRepository.saveUserRecord(newUser);
        }
      }
    } catch (e) {
      ZLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  /// Show a warning dialog before deleting the account
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(ZSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: ZSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  /// Delete User Account
  Future<void> deleteUserAccount() async {
    try {
      ZFullScreenLoader.openLoadingDialog('Processing...', ZImages.docerAnimation);

      /// First re-auth user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          ZFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          ZFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthUserLoginScreen());
        }
      }
    } catch (e) {
      // Remove the loader
      ZFullScreenLoader.stopLoading();
      // Show the warning
      ZLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Re-Auth before deleting
  Future<void> reAuthEmailAndPasswordUser() async {
    try {
      // Start Loading
      ZFullScreenLoader.openLoadingDialog('Processing...', ZImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove the loader
        ZFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        // Remove the loader
        ZFullScreenLoader.stopLoading();
        return;
      }

      final auth = AuthenticationRepository.instance;
      await auth.reAuthWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await auth.deleteAccount();

      // Remove the loader
      ZFullScreenLoader.stopLoading();

      // Go to previous Screen
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      // Remove the loader
      ZFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Function to upload user profile image.
  Future<void> uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // Upload the image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update user data in Firestore
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSpecificFields(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        ZLoaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
