import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/auth/form_divider.dart';
import '../../../../common/widgets/auth/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(ZTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Form
              const ZSignUpForm(),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Divider
              ZFormDivider(deviderText: ZTexts.orSignUpWith.capitalize!),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Footer
              const ZSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
