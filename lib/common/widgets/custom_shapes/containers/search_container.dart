import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ZSearchContainer extends StatelessWidget {
  const ZSearchContainer({
    super.key,
    this.onTap,
    required this.text,
    this.showBorder = true,
    this.showBackground = true,
    this.icon = Iconsax.search_normal,
    this.padding = const EdgeInsets.symmetric(horizontal: ZSizes.defaultSpace),
  });

  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: ZDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(ZSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? ZColors.dark
                    : ZColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(ZSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: ZColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: ZColors.darkGrey),
              const SizedBox(width: ZSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
