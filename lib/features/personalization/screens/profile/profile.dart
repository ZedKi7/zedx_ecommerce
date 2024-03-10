import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const ZCircularImage(image: ZImages.user),
                    TextButton(onPressed: () {}, child: const Text('Change Profile Picture')),
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

              ZProfileMenu(title: 'Name', value: 'Coding with Z', onTap: () {}),
              ZProfileMenu(title: 'Username', value: 'coding_with_z', onTap: () {}),

              const SizedBox(height: ZSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: ZSizes.spaceBtwItems),

              /// Heading Personal Info
              const ZSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: ZSizes.spaceBtwItems),

              ZProfileMenu(title: 'User ID', value: '45689', icon: Iconsax.copy, onTap: () {}),
              ZProfileMenu(title: 'E-mail', value: 'coding_with_z', onTap: () {}),
              ZProfileMenu(title: 'Phone Number', value: '+92-317-8059528', onTap: () {}),
              ZProfileMenu(title: 'Gender', value: 'Male', onTap: () {}),
              ZProfileMenu(title: 'Date of Birth', value: '10 Oct, 1994', onTap: () {}),

              const Divider(),
              const SizedBox(height: ZSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
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
