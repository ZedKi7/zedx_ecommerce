import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';
import '../product_reviews/product_reviews.dart';
import 'widgets/bottom_add_to_cart.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_and_share.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ZBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            ZProductImageSlider(product: product),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(right: ZSizes.defaultSpace, left: ZSizes.defaultSpace, bottom: ZSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share
                  const ZRatingAndShare(),

                  /// Price, Title, Stock, Brand
                  ZProductMetaData(product: product),

                  /// Attributes
                  if (product.productType == ProductType.variable.toString()) ZProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString()) const SizedBox(width: ZSizes.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(width: ZSizes.spaceBtwSections),

                  /// Description
                  const ZSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(width: ZSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(width: ZSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ZSectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18)),
                    ],
                  ),

                  const SizedBox(width: ZSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
