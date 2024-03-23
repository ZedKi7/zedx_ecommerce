import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  Future<void> sendPasswordResetEmail() async {
    try {
      // Start Loading
      ZFullScreenLoader.openLoadingDialog('Processing your request...', ZImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove the loader
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        // Remove the loader
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Login user using Email & Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove the loader
      ZFullScreenLoader.stopLoading();

      // Show Success Screen
      ZLoaders.successSnackBar(title: 'Email sent', message: 'Email link sent to Reset your Password');

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove the loader
      ZFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Resend Reset Password Email
  Future<void> resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      ZFullScreenLoader.openLoadingDialog('Processing your request...', ZImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove the loader
        ZFullScreenLoader.stopLoading();
        return;
      }

      // Login user using Email & Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove the loader
      ZFullScreenLoader.stopLoading();

      // Show Success Screen
      ZLoaders.successSnackBar(title: 'Email sent', message: 'Email link sent to Reset your Password');
    } catch (e) {
      // Remove the loader
      ZFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
