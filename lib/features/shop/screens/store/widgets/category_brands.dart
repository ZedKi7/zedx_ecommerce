import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/shimmers/boxes_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../controllers/brand_controller.dart';
import '../../../models/category_model.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return FutureBuilder(
        future: brandController.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              ZListTileShimmer(),
              SizedBox(height: ZSizes.spaceBtwItems),
              ZBoxesShimmer(),
              SizedBox(height: ZSizes.spaceBtwItems),
            ],
          );
          final widget = ZCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

          if (widget != null) return widget;

          final brands = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future: brandController.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    final widget = ZCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return ZBrandShowcase(brand: brand, images: products.map((e) => e.thumbnail).toList());
                  });
            },
          );
        });
  }
}
