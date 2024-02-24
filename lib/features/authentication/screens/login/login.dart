import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/auth/form_divider.dart';
import '../../../../common/widgets/auth/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ZSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title
              const ZLoginHeader(),

              /// Form
              const ZLoginForm(),

              /// Divider
              ZFormDivider(deviderText: ZTexts.orSignInWith.capitalize!),
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
