import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class ZCartCounterIcon extends StatelessWidget {
  const ZCartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor = ZColors.white,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(color: ZColors.black, borderRadius: BorderRadius.circular(100)),
            child: Text('4', style: Theme.of(context).textTheme.labelLarge!.apply(color: ZColors.white, fontSizeFactor: 0.8)),
          ),
        ),
      ],
    );
  }
}
