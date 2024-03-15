import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../common/widgets/products/cart/product_quantity_with_add_remove_buttons.dart';
import '../../../../common/widgets/texts/product_price_text.dart';
import '../../../../utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: ListView.separated(
          itemCount: 5,
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(height: ZSizes.spaceBtwSections),
          itemBuilder: (_, index) => const Column(
            children: [
              ZCartItem(),
              SizedBox(width: ZSizes.spaceBtwItems),
              Row(
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
                  ZProductPriceText(price: '256'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: const Text('Checkout \$256.0')),
      ),
    );
  }
}
