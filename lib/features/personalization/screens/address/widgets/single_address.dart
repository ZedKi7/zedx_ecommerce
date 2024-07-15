import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/address_controller.dart';
import '../../../models/address_model.dart';

class ZSingleAddress extends StatelessWidget {
  const ZSingleAddress({
    super.key,
    required this.onTap,
    required this.address,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    final dark = ZHelperFunctions.isDarkMode(context);

    return Obx(() {
      final selectedAddressId = addressController.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: ZRoundedContainer(
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress ? ZColors.primary.withOpacity(0.5) : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? ZColors.darkerGrey
                  : ZColors.grey,
          margin: const EdgeInsets.only(bottom: ZSizes.spaceBtwItems),
          padding: const EdgeInsets.all(ZSizes.md),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? ZColors.light
                          : ZColors.dark
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: ZSizes.sm / 2),
                  Text(address.fomattedPhoneNo, maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: ZSizes.sm / 2),
                  Text(address.toString(), softWrap: true),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
