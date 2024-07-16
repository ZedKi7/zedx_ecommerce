import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/pricing_calculator.dart';
import '../../controllers/product/cart_controller.dart';
import '../../controllers/product/order_controller.dart';
import '../cart/widgets/cart_items.dart';
import 'widgets/billing_address_section.dart';
import 'widgets/billing_amount_section.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subTotal = CartController.instance.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = ZPricingCalculator.calculateTotalPrice(subTotal, 'US');
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
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => ZLoaders.warningSnackBar(title: 'Empty Cart', message: 'Add items in the cart in order to proceed.'),
            child: Text('Checkout \$$totalAmount')),
      ),
    );
  }
}
