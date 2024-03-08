import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/products_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ZCategoryTab extends StatelessWidget {
  const ZCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const ZBrandShowcase(images: [ZImages.productImage3, ZImages.productImage2, ZImages.productImage1]),
              const SizedBox(height: ZSizes.spaceBtwItems),

              /// Products
              ZSectionHeading(title: 'You might like', onPressed: () {}),
              const SizedBox(height: ZSizes.spaceBtwItems),

              ZGridLayout(itemCount: 4, itemBuilder: (_, index) => const ZProductCardVertical()),
              const SizedBox(height: ZSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
