import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../features/shop/screens/all_brands/brand_products.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../shimmers/shimmer_effect.dart';
import 'brand_card.dart';

class ZBrandShowcase extends StatelessWidget {
  const ZBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
      child: ZRoundedContainer(
        showBorder: true,
        borderColor: ZColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(ZSizes.md),
        margin: const EdgeInsets.only(bottom: ZSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Brand with Products Count
            ZBrandCard(brand: brand, showBorder: true),
            const SizedBox(height: ZSizes.spaceBtwItems),

            /// Brand Top 3 Prodcut Images
            Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList()),
          ],
        ),
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
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, progress) => const ZShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
