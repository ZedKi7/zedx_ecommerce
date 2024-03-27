import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/shimmers/shimmer_effect.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/banner_controller.dart';

class ZPromoSlider extends StatelessWidget {
  const ZPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());

    return Obx(() {
      if (bannerController.isLoading.value) return const ZShimmerEffect(width: double.infinity, height: 190);
      if (bannerController.banners.isEmpty) {
        return const Center(child: Text('No Data Found!'));
      }
      return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) => bannerController.updatePageIndicator(index),
            ),
            items: bannerController.banners
                .map((banner) => ZRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ))
                .toList(),
          ),
          const SizedBox(height: ZSizes.spaceBtwItems),
          Center(
            child: Obx(() {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < bannerController.banners.length; i++)
                    ZCircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor: bannerController.carousalCurrentIndex.value == i ? ZColors.primary : ZColors.grey,
                    ),
                ],
              );
            }),
          ),
        ],
      );
    });
  }
}
