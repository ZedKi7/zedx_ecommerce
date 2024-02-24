import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ZLoginHeader extends StatelessWidget {
  const ZLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          dark ? ZImages.lightAppLogo : ZImages.darkAppLogo,
          height: 150,
        ),
        Text(ZTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: ZSizes.sm),
        Text(ZTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
