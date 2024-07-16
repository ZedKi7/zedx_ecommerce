import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/shop/controllers/product/checkout_controller.dart';
import '../../../features/shop/models/payment_method_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';

class ZPaymentTile extends StatelessWidget {
  const ZPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final checkoutController = CheckoutController.instance;

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        checkoutController.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: ZRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: ZHelperFunctions.isDarkMode(context) ? ZColors.light : ZColors.white,
        padding: const EdgeInsets.all(ZSizes.sm),
        child: Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
