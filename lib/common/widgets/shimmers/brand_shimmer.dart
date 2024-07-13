import 'package:flutter/material.dart';

import '../layouts/grid_layout.dart';
import 'shimmer_effect.dart';

class ZBrandShimmer extends StatelessWidget {
  const ZBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ZGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const ZShimmerEffect(width: 300, height: 300),
    );
  }
}
