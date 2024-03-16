import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
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
              Text('support@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: ZSizes.spaceBtwItems),
              Text(ZTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(
                            () => SuccessScreen(
                              image: ZImages.staticSuccessIllustration,
                              title: ZTexts.yourAccountCreatedTitle,
                              subTitle: ZTexts.yourAccountCreatedSubTitle,
                              onPressed: () => Get.to(() => const LoginScreen()),
                            ),
                          ),
                      child: const Text(ZTexts.zContinue))),
              const SizedBox(height: ZSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () {}, child: const Text(ZTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
