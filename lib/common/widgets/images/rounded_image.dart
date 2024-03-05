import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class ZRoundedImage extends StatelessWidget {
  const ZRoundedImage({
    super.key,
    this.width,
    this.height,
    this.border,
    this.padding,
    this.onPressed,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.applyImageRadius = true,
    this.borderRadius = ZSizes.md,
    this.backgroundColor,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius, isNetworkImage;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
