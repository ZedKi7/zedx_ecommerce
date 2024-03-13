import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ZProductAttributes extends StatelessWidget {
  const ZProductAttributes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// Selected Attribute Pricing & Description
        ZRoundedContainer(
          padding: const EdgeInsets.all(ZSizes.md),
          backgroundColor: dark ? ZColors.darkerGrey : ZColors.grey,
          child: Column(
            /// Title, Price & Stock Status
            children: [
              Row(
                children: [
                  const ZSectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: ZSizes.spaceBtwItems),

                  ///
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Price
                      Row(
                        children: [
                          const ZProductTitleText(title: 'Price: ', smallSize: true),

                          /// Actual Price
                          Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: ZSizes.spaceBtwItems),

                          /// Sale Price
                          const ZProductPriceText(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const ZProductTitleText(title: 'Stock: ', smallSize: true),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const ZProductTitleText(
                title: 'This is the Description of the Product and it can go upto max 4 lines.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(width: ZSizes.spaceBtwItems),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ZSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(width: ZSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ZChoiceChip(text: 'Green', selected: false, onSelected: (value) {}),
                ZChoiceChip(text: 'Blue', selected: true, onSelected: (value) {}),
                ZChoiceChip(text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ZSectionHeading(title: 'Sizes', showActionButton: false),
            const SizedBox(width: ZSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ZChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {}),
                ZChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {}),
                ZChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
