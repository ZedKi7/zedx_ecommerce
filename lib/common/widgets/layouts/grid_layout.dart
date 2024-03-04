import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class ZGridLayout extends StatelessWidget {
  const ZGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
  });

  final int itemCount;
  final double mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: ZSizes.gridViewSpacing,
        crossAxisSpacing: ZSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
