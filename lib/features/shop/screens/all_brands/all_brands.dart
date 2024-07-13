import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/shimmers/brand_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/brand_controller.dart';
import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const ZAppBar(title: Text('Brands'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const ZSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: ZSizes.spaceBtwItems),

              /// Brands Grid
              Obx(() {
                if (brandController.isLoading.value) return const ZBrandShimmer();
                if (brandController.allBrands.isEmpty) {
                  return Center(
                      child: Text(
                    'No Data Found!',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
                  ));
                }

                return ZGridLayout(
                  itemCount: brandController.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) {
                    final brand = brandController.allBrands[index];
                    return ZBrandCard(
                      brand: brand,
                      showBorder: true,
                      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
