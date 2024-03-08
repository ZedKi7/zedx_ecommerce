import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class ZBrandShowcase extends StatelessWidget {
  const ZBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ZRoundedContainer(
      showBorder: true,
      borderColor: ZColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(ZSizes.md),
      margin: const EdgeInsets.only(bottom: ZSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Products Count
          const ZBrandCard(showBorder: true),
          const SizedBox(height: ZSizes.spaceBtwItems),

          /// Brand Top 3 Prodcut Images
          Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList()),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: ZRoundedContainer(
        height: 100,
        backgroundColor: ZHelperFunctions.isDarkMode(context) ? ZColors.darkerGrey : ZColors.light,
        margin: const EdgeInsets.only(right: ZSizes.sm),
        padding: const EdgeInsets.all(ZSizes.md),
        child: Image(image: AssetImage(image), fit: BoxFit.contain),
      ),
    );
  }
}
