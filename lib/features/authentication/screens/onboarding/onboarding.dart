import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding_controller.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: onBoardingController.pageController,
            onPageChanged: onBoardingController.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: ZImages.onBoardingImage1,
                title: ZTexts.onBoardingTitle1,
                subTitle: ZTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: ZImages.onBoardingImage2,
                title: ZTexts.onBoardingTitle2,
                subTitle: ZTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: ZImages.onBoardingImage3,
                title: ZTexts.onBoardingTitle3,
                subTitle: ZTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// CircularButton
          const OnBoardingDotNavigation(),
        ],
      ),
    );
  }
}
