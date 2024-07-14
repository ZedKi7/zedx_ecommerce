import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/rounded_image.dart';
import '../../../../common/widgets/products/products_cards/product_card_horizontal.dart';
import '../../../../common/widgets/shimmers/horizontal_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/category_controller.dart';
import '../../models/category_model.dart';
import '../all_products/all_products.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;

    return Scaffold(
      appBar: ZAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const ZRoundedImage(imageUrl: ZImages.promoBanner3, width: double.infinity),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Sub-Categories
              FutureBuilder(
                future: categoryController.getSubCategories(category.id),
                builder: (context, snapshot) {
                  const loader = ZHorizontalProductShimmer();
                  final widget = ZCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                  if (widget != null) return widget;

                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final subCategory = subCategories[index];
                      return FutureBuilder(
                          future: categoryController.getCategoryProducts(categoryId: subCategory.id),
                          builder: (context, snapshot) {
                            final widget = ZCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                            if (widget != null) return widget;

                            final products = snapshot.data!;
                            return Column(
                              children: [
                                /// Heading
                                ZSectionHeading(
                                  title: subCategory.name,
                                  onPressed: () => Get.to(
                                    () => AllProductsScreen(
                                      title: subCategory.name,
                                      futureMethod: categoryController.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: ZSizes.spaceBtwItems / 2),

                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                    itemCount: products.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => ZProductCardHorizontal(product: products[index]),
                                    separatorBuilder: (context, index) => const SizedBox(width: ZSizes.spaceBtwItems),
                                  ),
                                ),
                                const SizedBox(height: ZSizes.spaceBtwSections),
                              ],
                            );
                          });
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
