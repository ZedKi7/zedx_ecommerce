import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class ZTextFormFieldTheme {
  ZTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ZColors.darkGrey,
    suffixIconColor: ZColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: ZSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: ZSizes.fontSizeMd, color: ZColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: ZSizes.fontSizeSm, color: ZColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: ZColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ZColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ZColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ZColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ZColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: ZColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: ZColors.darkGrey,
    suffixIconColor: ZColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: ZSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: ZSizes.fontSizeMd, color: ZColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: ZSizes.fontSizeSm, color: ZColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: ZColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ZColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ZColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ZColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ZColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: ZColors.warning),
    ),
  );
}
