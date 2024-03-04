import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class ZCircularIcon extends StatelessWidget {
  const ZCircularIcon({
    super.key,
    this.color,
    this.width,
    this.height,
    this.onPressed,
    required this.icon,
    this.backgroundColor,
    this.size = ZSizes.lg,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : ZHelperFunctions.isDarkMode(context)
                ? ZColors.black.withOpacity(0.9)
                : ZColors.white.withOpacity(0.9),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}
