import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/loaders/animation_loader_widget.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/cart_controller.dart';
import '../checkout/checkout.dart';
import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Scaffold(
      appBar: ZAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Obx(() {
        final emptyWidget = ZAnimationLoaderWidget(
          text: 'Whoops! Cart is EMPTY',
          animation: ZImages.cartAnimation,
          showAction: true,
          actionText: "Let's fill it",
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (cartController.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(ZSizes.defaultSpace),
              child: ZCartItems(),
            ),
          );
        }
      }),

      /// Checkout Button
      bottomNavigationBar: cartController.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(ZSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() {
                  return Text('Checkout \$${cartController.totalCartPrice.value}');
                }),
              ),
            ),
    );
  }
}
