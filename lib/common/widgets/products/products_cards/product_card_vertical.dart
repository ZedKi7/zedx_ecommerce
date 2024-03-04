import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadow_styles.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_image.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class ZProductCardVertical extends StatelessWidget {
  const ZProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ZShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ZSizes.productImageRadius),
          color: dark ? ZColors.darkGrey : ZColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag

            ZRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(ZSizes.sm),
              backgroundColor: dark ? ZColors.dark : ZColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  const ZRoundedImage(imageUrl: ZImages.productImage1),

                  /// Discount Tag
                  Positioned(
                    top: 12,
                    child: ZRoundedContainer(
                      radius: ZSizes.sm,
                      backgroundColor: ZColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: ZSizes.sm, vertical: ZSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: ZColors.black)),
                    ),
                  ),

                  /// Favourite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: ZCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwItems / 2),

            /// Details

            Padding(
              padding: const EdgeInsets.only(left: ZSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ZProductTitleText(title: 'Green Nike Air Shoes', smallSize: true),
                  const SizedBox(height: ZSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text('Nike', style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis, maxLines: 1),
                      const SizedBox(height: ZSizes.xs),
                      const Icon(Iconsax.verify5, color: ZColors.primary, size: ZSizes.iconXs),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      const ZProductPriceText(price: '35.5'),

                      /// Add to Cart Button
                      Container(
                        decoration: const BoxDecoration(
                          color: ZColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ZSizes.cardRadiusMd),
                            bottomRight: Radius.circular(ZSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: ZSizes.iconLg * 1.2,
                          height: ZSizes.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: ZColors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
