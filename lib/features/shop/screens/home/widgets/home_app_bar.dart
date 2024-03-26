import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/shimmers/shimmer_effect.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../personalization/controllers/user_controller.dart';

class ZHomeAppBar extends StatelessWidget {
  const ZHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return ZAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ZTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: ZColors.grey)),
          Obx(() {
            if (userController.profileLoading.value) {
              /// Display a shimmer loader while user profile is being loaded
              return const ZShimmerEffect(width: 80, height: 15);
            } else {
              return Text(userController.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: ZColors.white));
            }
          }),
        ],
      ),
      actions: [
        ZCartCounterIcon(onPressed: () {}, iconColor: ZColors.white, counterBgColor: ZColors.black, counterTextColor: ZColors.white),
      ],
    );
  }
}
