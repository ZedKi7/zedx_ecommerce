import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class ZCircularImage extends StatelessWidget {
  const ZCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    required this.image,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.padding = ZSizes.sm,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final double width, height, padding;
  final Color? backgroundColor, overlayColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (ZHelperFunctions.isDarkMode(context) ? ZColors.black : ZColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        color: overlayColor,
        fit: fit,
      ),
    );
  }
}
