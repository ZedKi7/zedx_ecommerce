import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../cart/widgets/cart_items.dart';
import 'widgets/billing_address_section.dart';
import 'widgets/billing_amount_section.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: ZAppBar(title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              /// Cart items
              const ZCartItems(showAddRemoveButton: false),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Coupon TextField
              const ZCouponCode(),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Billing Section
              ZRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(ZSizes.md),
                backgroundColor: dark ? ZColors.black : ZColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    ZBillingAmountSection(),
                    SizedBox(height: ZSizes.spaceBtwSections),

                    /// Divider
                    Divider(),
                    SizedBox(height: ZSizes.spaceBtwSections),

                    /// Payment Methods
                    ZBillingPaymentSection(),
                    SizedBox(height: ZSizes.spaceBtwSections),

                    /// Address
                    ZBillingAddressSection(),
                    SizedBox(height: ZSizes.spaceBtwSections),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(
                  () => SuccessScreen(
                    image: ZImages.successfulPaymentIcon,
                    title: 'Payment Success!',
                    subTitle: 'Your items will be shipped soon!',
                    onPressed: () => Get.offAll(() => const NavigationMenu()),
                  ),
                ),
            child: const Text('Checkout \$256.0')),
      ),
    );
  }
}
