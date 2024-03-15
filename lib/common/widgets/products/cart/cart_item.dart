import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class ZCartItem extends StatelessWidget {
  const ZCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        ZRoundedImage(
          imageUrl: ZImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(ZSizes.sm),
          backgroundColor: ZHelperFunctions.isDarkMode(context) ? ZColors.darkerGrey : ZColors.light,
        ),
        const SizedBox(width: ZSizes.spaceBtwItems),

        /// Title, Ptice, Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ZBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: ZProductTitleText(title: 'Black Sports shoes', maxLines: 1)),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'EU 08', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
