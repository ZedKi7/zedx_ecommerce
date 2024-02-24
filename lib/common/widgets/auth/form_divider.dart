import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class ZFormDivider extends StatelessWidget {
  const ZFormDivider({super.key, required this.deviderText});

  final String deviderText;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? ZColors.darkGrey : ZColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
        Text(deviderText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark ? ZColors.darkGrey : ZColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
      ],
    );
  }
}
