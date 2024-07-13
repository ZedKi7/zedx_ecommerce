import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/favorites_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../icons/circular_icon.dart';

class ZFavoriteIcon extends StatelessWidget {
  const ZFavoriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.put(FavoritesController());

    return Obx(
      () => ZCircularIcon(
        icon: favoritesController.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart5,
        color: favoritesController.isFavorite(productId) ? ZColors.error : null,
        onPressed: () => favoritesController.toggleFavoriteProduct(productId),
      ),
    );
  }
}
