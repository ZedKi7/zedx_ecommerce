import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: ZAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          ZCartCounterIcon(onPressed: () {}),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 440,
              automaticallyImplyLeading: false,
              backgroundColor: dark ? ZColors.black : ZColors.white,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(ZSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// Search Bar
                    const SizedBox(height: ZSizes.spaceBtwItems),
                    const ZSearchContainer(text: 'Search In Store', showBackground: false, padding: EdgeInsets.zero),
                    const SizedBox(height: ZSizes.spaceBtwSections),

                    /// Featured Brands
                    ZSectionHeading(title: 'Featured Brands', onPressed: () {}),
                    const SizedBox(height: ZSizes.spaceBtwItems / 1.5),

                    /// Brands Grid
                    ZGridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) => const ZBrandCard(showBorder: false),
                    ),
                  ],
                ),
              ),

              /// Tabs
              bottom: const ZTabBar(
                tabs: [
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Furniture')),
                  Tab(child: Text('Electronics')),
                  Tab(child: Text('Clothes')),
                  Tab(child: Text('Cosmetics')),
                ],
              ),
            ),
          ];
        },

        /// Body
        body: const TabBarView(
          children: [
            ZCategoryTab(),
            ZCategoryTab(),
            ZCategoryTab(),
            ZCategoryTab(),
            ZCategoryTab(),
          ],
        ),
      ),
    );
  }
}
