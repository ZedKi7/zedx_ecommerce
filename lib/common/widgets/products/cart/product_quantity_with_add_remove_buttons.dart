import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class ZProductQuantityWithAddRemoveButtons extends StatelessWidget {
  const ZProductQuantityWithAddRemoveButtons({
    super.key,
    this.add,
    this.remove,
    required this.quantity,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ZCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: ZSizes.md,
          color: ZHelperFunctions.isDarkMode(context) ? ZColors.white : ZColors.black,
          backgroundColor: ZHelperFunctions.isDarkMode(context) ? ZColors.darkerGrey : ZColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: ZSizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: ZSizes.spaceBtwItems),
        ZCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: ZSizes.md,
          color: ZColors.white,
          backgroundColor: ZColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
