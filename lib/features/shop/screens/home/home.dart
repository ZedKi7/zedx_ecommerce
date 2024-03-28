import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/products_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product_controller.dart';
import '../all_products/all_products.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const ZPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  ZHomeAppBar(),
                  SizedBox(height: ZSizes.spaceBtwSections),

                  /// SearchBar
                  ZSearchContainer(text: 'Search in Store', showBorder: false),
                  SizedBox(height: ZSizes.spaceBtwSections),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: ZSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        ZSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: ZColors.white,
                        ),
                        SizedBox(height: ZSizes.spaceBtwItems),

                        /// Categories
                        ZHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: ZSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(ZSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo Slider
                  const ZPromoSlider(),
                  const SizedBox(height: ZSizes.spaceBtwSections),

                  /// Heading
                  ZSectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProductsScreen())),
                  const SizedBox(height: ZSizes.spaceBtwItems),

                  /// Popular Products
                  Obx(() {
                    if (productController.isLoading.value) return const ZVerticalProductShimmer();
                    if (productController.featuredProductes.isEmpty) {
                      return Center(
                        child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium),
                      );
                    } else {
                      return ZGridLayout(
                        itemCount: productController.featuredProductes.length,
                        itemBuilder: (_, index) => ZProductCardVertical(product: productController.featuredProductes[index]),
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
