import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../product_reviews/product_reviews.dart';
import 'widgets/bottom_add_to_cart.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_and_share.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ZBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            const ZProductImageSlider(),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(right: ZSizes.defaultSpace, left: ZSizes.defaultSpace, bottom: ZSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share
                  const ZRatingAndShare(),

                  /// Price, Title, Stock, Brand
                  const ZProductMetaData(),

                  /// Attributes
                  const ZProductAttributes(),
                  const SizedBox(width: ZSizes.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(width: ZSizes.spaceBtwSections),

                  /// Description
                  const ZSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(width: ZSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a product edscription for Blue Nike Sleeve less vest. There are more things that can be added ...',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
