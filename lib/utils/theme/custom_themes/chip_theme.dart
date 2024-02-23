import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ZChipTheme {
  ZChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: ZColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: ZColors.black),
    selectedColor: ZColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: ZColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: ZColors.darkerGrey,
    labelStyle: TextStyle(color: ZColors.white),
    selectedColor: ZColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: ZColors.white,
  );
}
