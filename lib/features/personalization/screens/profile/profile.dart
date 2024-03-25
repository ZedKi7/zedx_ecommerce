import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/loaders/shimmer_effect.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';
import 'change_name.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;

    return Scaffold(
      appBar: const ZAppBar(title: Text('Profile'), showBackArrow: true),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = userController.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : ZImages.user;
                      return userController.imageUploading.value
                          ? const ZShimmerEffect(width: 80, height: 80, radius: 80)
                          : ZCircularImage(width: 80, height: 80, image: image, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed: () => userController.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: ZSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: ZSizes.spaceBtwItems),

              /// Heading Profile Info
              const ZSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: ZSizes.spaceBtwItems),

              ZProfileMenu(title: 'Name', value: userController.user.value.fullName, onTap: () => Get.to(() => const ChangeNameScreen())),
              ZProfileMenu(title: 'Username', value: userController.user.value.username, onTap: () {}),

              const SizedBox(height: ZSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: ZSizes.spaceBtwItems),

              /// Heading Personal Info
              const ZSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: ZSizes.spaceBtwItems),

              ZProfileMenu(title: 'User ID', value: userController.user.value.id, icon: Iconsax.copy, onTap: () {}),
              ZProfileMenu(title: 'E-mail', value: userController.user.value.email, onTap: () {}),
              ZProfileMenu(title: 'Phone Number', value: userController.user.value.phoneNumber, onTap: () {}),
              ZProfileMenu(title: 'Gender', value: 'Male', onTap: () {}),
              ZProfileMenu(title: 'Date of Birth', value: '10 Oct, 1994', onTap: () {}),

              const Divider(),
              const SizedBox(height: ZSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => userController.deleteAccountWarningPopup(),
                  child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
