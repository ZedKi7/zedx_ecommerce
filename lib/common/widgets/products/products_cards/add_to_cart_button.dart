import 'package:get/get.dart';

import '../../../../features/shop/controllers/product/cart_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailsScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart = cartController.getProductQuantityInCart(product.id);

        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? ZColors.primary : ZColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(ZSizes.cardRadiusMd),
              bottomRight: Radius.circular(ZSizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            width: ZSizes.iconLg * 1.2,
            height: ZSizes.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(context).textTheme.bodyLarge!.apply(color: ZColors.white),
                    )
                  : const Icon(Iconsax.add, color: ZColors.white),
            ),
          ),
        );
      }),
    );
  }
}
