import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_and_share.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            ZProductImageSlider(),

            /// Product Details
            Padding(
              padding: EdgeInsets.only(right: ZSizes.defaultSpace, left: ZSizes.defaultSpace, bottom: ZSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share
                  ZRatingAndShare(),

                  /// Price, Title, Stock, Brand
                  ZProductMetaData(),

                  /// Attributes
                  /// Checkout Button
                  /// Description
                  /// Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
