import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/texts/brand_title_with_verified_icon.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ZProductMetaData extends StatelessWidget {
  const ZProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            Positioned(
              top: 12,
              child: ZRoundedContainer(
                radius: ZSizes.sm,
                backgroundColor: ZColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(horizontal: ZSizes.sm, vertical: ZSizes.xs),
                child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: ZColors.black)),
              ),
            ),
            const SizedBox(width: ZSizes.spaceBtwItems),

            /// Price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: ZSizes.spaceBtwItems),
            const ZProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(width: ZSizes.spaceBtwItems / 1.5),

        /// Title
        const ZProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(width: ZSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const ZProductTitleText(title: 'Status'),
            const SizedBox(width: ZSizes.spaceBtwItems / 1.5),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: ZSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            ZCircularImage(
              image: ZImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? ZColors.white : ZColors.black,
            ),
            const ZBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
