import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/checkout_controller.dart';

class ZBillingPaymentSection extends StatelessWidget {
  const ZBillingPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.put(CheckoutController());
    final dark = ZHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        ZSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () => checkoutController.selectPaymentMethod(context)),
        const SizedBox(height: ZSizes.spaceBtwSections / 2),
        Obx(
          () => Row(
            children: [
              ZRoundedContainer(
                width: 60,
                height: 35,
                padding: const EdgeInsets.all(ZSizes.sm),
                backgroundColor: dark ? ZColors.light : ZColors.white,
                child: Image(image: AssetImage(checkoutController.selectedPaymentMethod.value.image), fit: BoxFit.contain),
              ),
              const SizedBox(height: ZSizes.spaceBtwSections / 2),
              Text(checkoutController.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
