import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class ZSocialButtons extends StatelessWidget {
  const ZSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: ZColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => loginController.googleSignIn(),
            icon: Image.asset(ZImages.google, width: ZSizes.iconMd, height: ZSizes.iconMd),
          ),
        ),
        const SizedBox(width: ZSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: ZColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(ZImages.facebook, width: ZSizes.iconMd, height: ZSizes.iconMd),
          ),
        ),
      ],
    );
  }
}
