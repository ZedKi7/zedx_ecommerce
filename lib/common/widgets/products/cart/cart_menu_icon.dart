import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/cart_controller.dart';
import '../../../../features/shop/screens/cart/cart.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ZCartCounterIcon extends StatelessWidget {
  const ZCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final dark = ZHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(color: counterBgColor ?? (dark ? ZColors.white : ZColors.black), borderRadius: BorderRadius.circular(100)),
            child: Center(
                child: Obx(
              () => Text(cartController.noOfCartItems.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: counterTextColor ?? (dark ? ZColors.black : ZColors.white), fontSizeFactor: 0.8)),
            )),
          ),
        ),
      ],
    );
  }
}
