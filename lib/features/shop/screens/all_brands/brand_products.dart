import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/brand_controller.dart';
import '../../models/brand_model.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: ZAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              ZBrandCard(
                showBorder: true,
                brand: brand,
              ),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Brand's Products
              FutureBuilder(
                  future: brandController.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    const loader = ZVerticalProductShimmer();
                    final widget = ZCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;

                    final brandProducts = snapshot.data!;
                    return ZSortableProducts(products: brandProducts);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
