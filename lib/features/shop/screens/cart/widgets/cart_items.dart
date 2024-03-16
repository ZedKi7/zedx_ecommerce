import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/cart/product_quantity_with_add_remove_buttons.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class ZCartItems extends StatelessWidget {
  const ZCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: ZSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          const ZCartItem(),
          if (showAddRemoveButton) const SizedBox(width: ZSizes.spaceBtwItems),

          /// Add, Remove Buttons with total price
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Extra Space
                    SizedBox(width: 70),

                    /// Add, Remove Buttons
                    ZProductQuantityWithAddRemoveButtons(),
                  ],
                ),

                /// Product total price
                ZProductPriceText(price: '256'),
              ],
            ),
        ],
      ),
    );
  }
}
