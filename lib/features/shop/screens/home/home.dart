import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            ZPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  ZHomeAppBar(),
                  SizedBox(height: ZSizes.spaceBtwSections),

                  /// SearchBar
                  ZSearchContainer(text: 'Search in Store'),
                  SizedBox(height: ZSizes.spaceBtwSections),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: ZSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        ZSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: ZColors.white,
                        ),
                        SizedBox(height: ZSizes.spaceBtwItems),

                        /// Categories
                        ZHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
