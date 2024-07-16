import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/cart/product_quantity_with_add_remove_buttons.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/cart_controller.dart';

class ZCartItems extends StatelessWidget {
  const ZCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(() {
      return ListView.separated(
        itemCount: cartController.cartItems.length,
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: ZSizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];

          return Column(
            children: [
              /// Cart Item
              ZCartItem(cartItem: item),
              if (showAddRemoveButton) const SizedBox(width: ZSizes.spaceBtwItems),

              /// Add, Remove Buttons with total price
              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        /// Extra Space
                        const SizedBox(width: 70),

                        /// Add, Remove Buttons
                        ZProductQuantityWithAddRemoveButtons(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),

                    /// Product total price
                    ZProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                ),
            ],
          );
        }),
      );
    });
  }
}
