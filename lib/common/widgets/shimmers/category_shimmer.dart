import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'shimmer_effect.dart';

class ZCategoryShimmer extends StatelessWidget {
  const ZCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: ZSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              ZShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(width: ZSizes.spaceBtwItems / 2),

              /// Text
              ZShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
