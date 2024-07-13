import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/loaders/animation_loader_widget.dart';
import '../../../../common/widgets/products/products_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/product/favorites_controller.dart';
import '../home/home.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesController = FavoritesController.instance;

    return Scaffold(
      appBar: ZAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          ZCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                future: favoritesController.favoriteProducts(),
                builder: (context, snapshot) {
                  final emptyWidget = ZAnimationLoaderWidget(
                    text: 'Whoops! Whishlist is Empty...',
                    animation: ZImages.pencilAnimation,
                    showAction: true,
                    actionText: "Let's add some",
                    onActionPressed: () => Get.off(() => const NavigationMenu()),
                  );
                  const loader = ZVerticalProductShimmer(itemCount: 6);
                  final widget = ZCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);

                  if (widget != null) return widget;

                  final products = snapshot.data!;

                  return ZGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) => ZProductCardVertical(product: products[index]),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
