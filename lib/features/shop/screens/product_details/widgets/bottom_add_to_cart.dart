import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/cart_controller.dart';
import '../../../models/product_model.dart';

class ZBottomAddToCart extends StatelessWidget {
  const ZBottomAddToCart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    cartController.updateAlreadyAddedProductCount(product);
    final dark = ZHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ZSizes.defaultSpace, vertical: ZSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? ZColors.darkerGrey : ZColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ZSizes.cardRadiusLg),
          topRight: Radius.circular(ZSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ZCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: ZColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: ZColors.white,
                  onPressed: () => cartController.productQuantityInCart.value < 1 ? null : cartController.productQuantityInCart.value -= 1,
                ),
                const SizedBox(width: ZSizes.spaceBtwItems),
                Text(cartController.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: ZSizes.spaceBtwItems),
                ZCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: ZColors.black,
                  width: 40,
                  height: 40,
                  color: ZColors.white,
                  onPressed: () => cartController.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: cartController.productQuantityInCart.value < 1 ? null : () => cartController.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(ZSizes.md),
                backgroundColor: ZColors.black,
                side: const BorderSide(color: ZColors.black),
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
