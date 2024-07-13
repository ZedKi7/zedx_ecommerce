import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'shimmer_effect.dart';

class ZListTileShimmer extends StatelessWidget {
  const ZListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            ZShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: ZSizes.spaceBtwItems),
            Column(
              children: [
                ZShimmerEffect(width: 100, height: 15),
                SizedBox(width: ZSizes.spaceBtwItems / 2),
                ZShimmerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
