import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
import '../favorite_icon/favorite_icon.dart';

class ZProductCardHorizontal extends StatelessWidget {
  const ZProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final productController = ProductController.instance;
    final salePercentage = productController.calculateSalePrecentage(product.price, product.salePrice);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ZSizes.productImageRadius),
        color: dark ? ZColors.darkerGrey : ZColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          ZRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(ZSizes.sm),
            backgroundColor: dark ? ZColors.dark : ZColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: ZRoundedImage(imageUrl: product.thumbnail, isNetworkImage: true),
                ),

                /// Discount Tag
                if (salePercentage != null)
                  Positioned(
                    top: 12,
                    child: ZRoundedContainer(
                      radius: ZSizes.sm,
                      backgroundColor: ZColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: ZSizes.sm, vertical: ZSizes.xs),
                      child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: ZColors.black)),
                    ),
                  ),

                /// Favorite Icon Button
                Positioned(
                  top: 0,
                  right: 0,
                  child: ZFavoriteIcon(productId: product.id),
                ),
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: ZSizes.sm, left: ZSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ZProductTitleText(title: product.title, smallSize: true),
                      const SizedBox(height: ZSizes.spaceBtwItems / 2),
                      ZBrandTitleWithVerifiedIcon(title: product.brand!.name),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      Flexible(
                        child: Column(
                          children: [
                            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: ZSizes.sm),
                                child: Text(
                                  '\$${product.price.toString()}',
                                  style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(left: ZSizes.sm),
                              child: ZProductPriceText(price: productController.getProductPrice(product)),
                            ),
                          ],
                        ),
                      ),

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
            ),
          ),
        ],
      ),
    );
  }
}
