import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class ZShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: ZColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final hozizontalProductShadow = BoxShadow(
    color: ZColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
