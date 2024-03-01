import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class ZCircularContainer extends StatelessWidget {
  const ZCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.margin,
    this.backgroundColor = ZColors.white,
  });

  final double height, width, radius, padding;
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
