import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/loaders/animation_loader_widget.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/order_controller.dart';

class ZOrderListItems extends StatelessWidget {
  const ZOrderListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    final dark = ZHelperFunctions.isDarkMode(context);

    return FutureBuilder(
        future: orderController.fetchUserOrders(),
        builder: (_, snapshot) {
          final emptyWidget = ZAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet',
            animation: ZImages.orderCompletedAnimation,
            showAction: true,
            actionText: "Let's fill it",
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          final response = ZCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          final orders = snapshot.data!;

          return ListView.separated(
            itemCount: orders.length,
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(height: ZSizes.spaceBtwItems),
            itemBuilder: (_, index) {
              final order = orders[index];

              return ZRoundedContainer(
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
                              Text(
                                order.orderStatusText,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge!.apply(color: ZColors.primary, fontWeightDelta: 1),
                              ),
                              Text(order.formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall),
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
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                    Text(
                                      order.id,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
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
                                    Text(
                                      'Shipping Date',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                    Text(
                                      order.formattedDeliveryDate,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
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
              );
            },
          );
        });
  }
}
