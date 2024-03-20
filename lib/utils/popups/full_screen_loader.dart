import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader_widget.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog.
class ZFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation. /// This method doesn't return anything.
  ///
  /// Parameters:
  /// text: The text to be displayed in the loading dialog.
  /// animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      barrierDismissible: false,
      context: Get.overlayContext!,
      builder: (context) => PopScope(
        canPop: false,
        child: Container(
          color: ZHelperFunctions.isDarkMode(context) ? ZColors.dark : ZColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              ZAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog.
  /// This method doesn't return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
