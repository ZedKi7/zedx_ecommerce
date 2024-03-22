import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final deviceStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = deviceStorage.read('REMEMBER_ME_EMAIL') ?? email.text;
    password.text = deviceStorage.read('REMEMBER_ME_PASSWORD') ?? password.text;
    super.onInit();
  }

  /// Email and Password SignIn
  Future<void> singInWithEmailAndPassword() async {
    try {
      // Start Loading
      ZFullScreenLoader.openLoadingDialog('Logging you in...', ZImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove the loader
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove the loader
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        deviceStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        deviceStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove the loader
      ZFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove the loader
      ZFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      ZFullScreenLoader.openLoadingDialog('Logging you in...', ZImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove the loader
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove the loader
      ZFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove the loader
      ZFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
