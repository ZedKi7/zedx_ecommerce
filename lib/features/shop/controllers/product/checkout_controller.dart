import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/list_tiles/payment_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: ZImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(ZSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ZSectionHeading(title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: ZSizes.spaceBtwSections),
              ZPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: ZImages.paypal)),
              const SizedBox(height: ZSizes.spaceBtwItems / 2),
              ZPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: ZImages.googlePay)),
              const SizedBox(height: ZSizes.spaceBtwItems / 2),
              ZPaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: ZImages.applePay)),
              const SizedBox(height: ZSizes.spaceBtwItems / 2),
              ZPaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: ZImages.visa)),
              const SizedBox(height: ZSizes.spaceBtwItems / 2),
              ZPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: ZImages.masterCard)),
              const SizedBox(height: ZSizes.spaceBtwItems / 2),
              ZPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paytm', image: ZImages.paytm)),
              const SizedBox(height: ZSizes.spaceBtwItems / 2),
              ZPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paystack', image: ZImages.paystack)),
              const SizedBox(height: ZSizes.spaceBtwItems / 2),
              ZPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: ZImages.creditCard)),
              const SizedBox(height: ZSizes.spaceBtwItems / 2),
              const SizedBox(height: ZSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
