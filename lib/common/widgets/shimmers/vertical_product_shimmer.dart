import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';
import 'shimmer_effect.dart';

class ZVerticalProductShimmer extends StatelessWidget {
  const ZVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ZGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            ZShimmerEffect(width: 180, height: 180),
            SizedBox(width: ZSizes.spaceBtwItems),

            /// Text
            ZShimmerEffect(width: 160, height: 15),
            SizedBox(width: ZSizes.spaceBtwItems / 2),
            ZShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
