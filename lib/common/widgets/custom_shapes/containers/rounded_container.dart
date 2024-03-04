import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ZRoundedContainer extends StatelessWidget {
  const ZRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.radius = ZSizes.cardRadiusLg,
    this.backgroundColor = ZColors.white,
    this.borderColor = ZColors.borderPrimary,
  });

  final double radius;
  final Widget? child;
  final bool showBorder;
  final double? height, width;
  final Color backgroundColor, borderColor;
  final EdgeInsetsGeometry? margin, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
