import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class ZPromoSlider extends StatelessWidget {
  const ZPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => homeController.updatePageIndicator(index),
          ),
          items: banners.map((url) => ZRoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: ZSizes.spaceBtwItems),
        Center(
          child: Obx(() {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  ZCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: homeController.carousalCurrentIndex.value == i ? ZColors.primary : ZColors.grey,
                  ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
