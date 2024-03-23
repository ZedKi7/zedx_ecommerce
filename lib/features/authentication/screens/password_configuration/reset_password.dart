import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/forget_password/forget_password_controller.dart';
import '../login/login.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image.asset(ZImages.deliveredEmailIllustration, width: ZHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Email, Title & Sub-Title
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
              const SizedBox(height: ZSizes.spaceBtwItems),
              Text(ZTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: ZSizes.spaceBtwItems),
              Text(ZTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const LoginScreen()), child: const Text(ZTexts.done))),
              const SizedBox(height: ZSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(ZTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
