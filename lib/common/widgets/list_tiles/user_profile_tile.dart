import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';

class ZUserProfileTile extends StatelessWidget {
  const ZUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;

    return ListTile(
      leading: const ZCircularImage(image: ZImages.user, width: 50, height: 50, padding: 0),
      title: Text(userController.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: ZColors.white)),
      subtitle: Text(userController.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: ZColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: ZColors.white)),
    );
  }
}
