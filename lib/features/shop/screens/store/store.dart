import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/brand_title_with_verified_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

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

                      ZGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () {},
                          child: ZRoundedContainer(
                            padding: const EdgeInsets.all(ZSizes.sm),
                            showBorder: true,
                            backgroundColor: Colors.transparent,
                            child: Row(
                              children: [
                                /// Icon
                                Flexible(
                                  child: ZCircularImage(
                                    image: ZImages.clothIcon,
                                    backgroundColor: Colors.transparent,
                                    overlayColor: dark ? ZColors.white : ZColors.black,
                                  ),
                                ),
                                const SizedBox(height: ZSizes.spaceBtwItems / 2),

                                /// Text
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const ZBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                                      Text('256 products', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container()),
    );
  }
}
