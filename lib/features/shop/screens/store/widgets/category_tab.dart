import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/products_cards/product_card_vertical.dart';
import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../controllers/category_controller.dart';
import '../../../models/category_model.dart';
import '../../all_products/all_products.dart';
import 'category_brands.dart';

class ZCategoryTab extends StatelessWidget {
  const ZCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              CategoryBrands(category: category),
              const SizedBox(height: ZSizes.spaceBtwItems),

              /// Products
              FutureBuilder(
                  future: categoryController.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    final widget = ZCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const ZVerticalProductShimmer());

                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return Column(
                      children: [
                        ZSectionHeading(
                          title: 'You might like',
                          onPressed: () => Get.to(() => AllProductsScreen(
                                title: category.name,
                                futureMethod: categoryController.getCategoryProducts(categoryId: category.id, limit: -1),
                              )),
                        ),
                        const SizedBox(height: ZSizes.spaceBtwItems),
                        ZGridLayout(itemCount: products.length, itemBuilder: (_, index) => ZProductCardVertical(product: products[index])),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
