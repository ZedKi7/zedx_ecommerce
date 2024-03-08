import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class ZTabBar extends StatelessWidget implements PreferredSizeWidget {
  const ZTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Material(
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: ZColors.primary,
        unselectedLabelColor: ZColors.darkGrey,
        labelColor: dark ? ZColors.white : ZColors.primary,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ZDeviceUtils.getAppBarHeight());
}
