import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class TermsAndConditionsCheckbox extends StatelessWidget {
  const TermsAndConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final signUpController = SignUpController.instance;

    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Obx(
            () => Checkbox(
              value: signUpController.privacyPolicy.value,
              onChanged: (_) => signUpController.privacyPolicy.value = !signUpController.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(height: ZSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '${ZTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${ZTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? ZColors.white : ZColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? ZColors.white : ZColors.primary,
                    ),
              ),
              TextSpan(text: '${ZTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: ZTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? ZColors.white : ZColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? ZColors.white : ZColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
