import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ZOrderListItems extends StatelessWidget {
  const ZOrderListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return ListView.separated(
      itemCount: 7,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: ZSizes.spaceBtwItems),
      itemBuilder: (_, index) => ZRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(ZSizes.md),
        backgroundColor: dark ? ZColors.dark : ZColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row 1
            Row(
              children: [
                /// Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: ZSizes.spaceBtwItems / 2),

                /// Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: ZColors.primary, fontWeightDelta: 1)),
                      Text('07 Nov 2024', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                /// Icon
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: ZSizes.iconSm)),
              ],
            ),
            const SizedBox(width: ZSizes.spaceBtwItems),

            /// Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: ZSizes.spaceBtwItems / 2),

                      /// Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('[#256f2]', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: ZSizes.spaceBtwItems / 2),

                      /// Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
                            Text('03 Feb 2025', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
