import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = OnBoardingController.instance;
    final dark = ZHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: ZDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: ZSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: onBoardingController.pageController,
        onDotClicked: onBoardingController.dotNavigationClick,
        effect: ExpandingDotsEffect(activeDotColor: dark ? ZColors.light : ZColors.dark, dotHeight: 6),
      ),
    );
  }
}
