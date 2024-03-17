import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              /// Brands
              ZGridLayout(
                itemCount: 7,
                mainAxisExtent: 80,
                itemBuilder: (_, index) => ZBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProductsScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
