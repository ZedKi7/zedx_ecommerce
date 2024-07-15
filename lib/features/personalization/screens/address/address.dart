import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/address_controller.dart';
import 'add_new_address.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: ZColors.primary,
        child: const Icon(Iconsax.add, color: ZColors.white),
      ),
      appBar: ZAppBar(showBackArrow: true, title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                key: Key(addressController.refreshData.value.toString()),
                future: addressController.getAllUserAddresses(),
                builder: (context, snapshot) {
                  final widget = ZCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);

                  if (widget != null) return widget;

                  final addresses = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) => ZSingleAddress(
                      address: addresses[index],
                      onTap: () => addressController.selectedAddress(addresses[index]),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
