import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class ZElevatedButtonTheme {
  ZElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ZColors.light,
      backgroundColor: ZColors.primary,
      disabledForegroundColor: ZColors.darkGrey,
      disabledBackgroundColor: ZColors.buttonDisabled,
      side: const BorderSide(color: ZColors.primary),
      padding: const EdgeInsets.symmetric(vertical: ZSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: ZColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ZSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ZColors.light,
      backgroundColor: ZColors.primary,
      disabledForegroundColor: ZColors.darkGrey,
      disabledBackgroundColor: ZColors.darkerGrey,
      side: const BorderSide(color: ZColors.primary),
      padding: const EdgeInsets.symmetric(vertical: ZSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: ZColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ZSizes.buttonRadius)),
    ),
  );
}
