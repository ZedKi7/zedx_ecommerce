import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/variation_controller.dart';
import '../../../models/product_model.dart';

class ZProductAttributes extends StatelessWidget {
  const ZProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final variationController = Get.put(VariationController());

    return Obx(
      () => Column(
        children: [
          /// Selected Attribute Pricing & Description
          // Display variation price and stock when some variation is selected
          if (variationController.selectedVariation.value.id.isNotEmpty)
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
                              if (variationController.selectedVariation.value.salePrice > 0)
                                Text('\$${variationController.selectedVariation.value.price}',
                                    style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                              const SizedBox(width: ZSizes.spaceBtwItems),

                              /// Sale Price
                              ZProductPriceText(price: variationController.getVariationPrice()),
                            ],
                          ),

                          /// Stock
                          Row(
                            children: [
                              const ZProductTitleText(title: 'Stock: ', smallSize: true),
                              Text(variationController.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Variation Description
                  ZProductTitleText(
                    title: variationController.selectedVariation.value.description ?? '',
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
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ZSectionHeading(title: attribute.name ?? '', showActionButton: false),
                        const SizedBox(width: ZSizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map(
                                (attributeValue) {
                                  final isSelected = variationController.selectedAttributes[attribute.name] == attributeValue;
                                  final available = variationController
                                      .getAttributeAvailabilityInVariation(product.productVariations!, attribute.name!)
                                      .contains(attributeValue);

                                  return ZChoiceChip(
                                      text: attributeValue,
                                      selected: isSelected,
                                      onSelected: available
                                          ? (selected) {
                                              if (selected) {
                                                variationController.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                                              }
                                            }
                                          : null);
                                },
                              ).toList()),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
