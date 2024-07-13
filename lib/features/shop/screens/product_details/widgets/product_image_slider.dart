import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/products/favorite_icon/favorite_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/images_controller.dart';
import '../../../models/product_model.dart';

class ZProductImageSlider extends StatelessWidget {
  const ZProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    final imagesController = Get.put(ImagesController());
    final images = imagesController.getAllProductImages(product);

    return ZCurvedEdgesWidget(
      child: Container(
        color: dark ? ZColors.darkerGrey : ZColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(ZSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = imagesController.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => imagesController.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) => CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: ZColors.primary,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: ZSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: ZSizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(() {
                    final selectedImage = imagesController.selectedProductImage.value == images[index];

                    return ZRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      imageUrl: images[index],
                      padding: const EdgeInsets.all(ZSizes.sm),
                      backgroundColor: dark ? ZColors.dark : ZColors.white,
                      onPressed: () => imagesController.selectedProductImage.value = images[index],
                      border: Border.all(color: selectedImage ? ZColors.primary : Colors.transparent),
                    );
                  }),
                ),
              ),
            ),

            /// Appbar Icons
            ZAppBar(
              showBackArrow: true,
              actions: [ZFavoriteIcon(productId: product.id)],
            ),
          ],
        ),
      ),
    );
  }
}
