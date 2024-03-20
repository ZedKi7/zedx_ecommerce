import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/signup/verify_email_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final verifyEmailController = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image.asset(width: ZHelperFunctions.screenWidth() * 0.6, ZImages.deliveredEmailIllustration),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Title & Sub-Title
              Text(ZTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: ZSizes.spaceBtwItems),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: ZSizes.spaceBtwItems),
              Text(ZTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => verifyEmailController.checkEmailVerificationStatus(),
                    child: const Text(ZTexts.zContinue),
                  )),
              const SizedBox(height: ZSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => verifyEmailController.sendEmailVerification(),
                    child: const Text(ZTexts.resendEmail),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
