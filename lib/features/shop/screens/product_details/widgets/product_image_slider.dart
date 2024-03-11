import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ZProductImageSlider extends StatelessWidget {
  const ZProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return ZCurvedEdgesWidget(
      child: Container(
        color: dark ? ZColors.darkerGrey : ZColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(ZSizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(ZImages.productImage1))),
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
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: ZSizes.spaceBtwItems),
                  itemBuilder: (_, index) => ZRoundedImage(
                    width: 80,
                    imageUrl: ZImages.productImage3,
                    padding: const EdgeInsets.all(ZSizes.sm),
                    border: Border.all(color: ZColors.primary),
                    backgroundColor: dark ? ZColors.dark : ZColors.white,
                  ),
                ),
              ),
            ),

            /// Appbar Icons
            const ZAppBar(
              showBackArrow: true,
              actions: [
                ZCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
