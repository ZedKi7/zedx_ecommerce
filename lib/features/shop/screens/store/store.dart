import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/shimmers/brand_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/brand_controller.dart';
import '../../controllers/category_controller.dart';
import '../all_brands/all_brands.dart';
import '../all_brands/brand_products.dart';
import 'widgets/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
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
                backgroundColor: ZHelperFunctions.isDarkMode(context) ? ZColors.black : ZColors.white,
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
                      ZSectionHeading(title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrandsScreen())),
                      const SizedBox(height: ZSizes.spaceBtwItems / 1.5),

                      /// Brands Grid
                      Obx(() {
                        if (brandController.isLoading.value) return const ZBrandShimmer();
                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                              child: Text(
                            'No Data Found!',
                            style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
                          ));
                        }

                        return ZGridLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return ZBrandCard(
                              brand: brand,
                              showBorder: true,
                              onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),

                /// Tabs
                bottom: ZTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              ),
            ];
          },

          /// Body
          body: TabBarView(
            children: categories.map((category) => ZCategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}
