import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'shimmer_effect.dart';

class ZBoxesShimmer extends StatelessWidget {
  const ZBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: ZShimmerEffect(width: 150, height: 110)),
            SizedBox(width: ZSizes.spaceBtwItems),
            Expanded(child: ZShimmerEffect(width: 150, height: 110)),
            SizedBox(width: ZSizes.spaceBtwItems),
            Expanded(child: ZShimmerEffect(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
