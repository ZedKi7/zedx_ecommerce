import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ZBillingPaymentSection extends StatelessWidget {
  const ZBillingPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        ZSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox(height: ZSizes.spaceBtwSections / 2),
        Row(
          children: [
            ZRoundedContainer(
              width: 60,
              height: 35,
              padding: const EdgeInsets.all(ZSizes.sm),
              backgroundColor: dark ? ZColors.light : ZColors.white,
              child: const Image(image: AssetImage(ZImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(height: ZSizes.spaceBtwSections / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
