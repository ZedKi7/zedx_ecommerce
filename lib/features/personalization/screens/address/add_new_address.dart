import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/address_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Scaffold(
      appBar: const ZAppBar(showBackArrow: true, title: Text('Add New Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Form(
            key: addressController.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: addressController.name,
                  validator: (value) => ZValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(height: ZSizes.spaceBtwInputFields),
                TextFormField(
                  controller: addressController.phoneNumber,
                  validator: ZValidator.validatePhoneNumber,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number'),
                ),
                const SizedBox(height: ZSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: addressController.street,
                      validator: (value) => ZValidator.validateEmptyText('Street', value),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'),
                    )),
                    const SizedBox(width: ZSizes.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                      controller: addressController.postalCode,
                      validator: (value) => ZValidator.validateEmptyText('Postal Code', value),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'),
                    )),
                  ],
                ),
                const SizedBox(height: ZSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: addressController.city,
                      validator: (value) => ZValidator.validateEmptyText('City', value),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'),
                    )),
                    const SizedBox(width: ZSizes.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                      controller: addressController.state,
                      validator: (value) => ZValidator.validateEmptyText('State', value),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'),
                    )),
                  ],
                ),
                const SizedBox(height: ZSizes.spaceBtwInputFields),
                Expanded(
                    child: TextFormField(
                  controller: addressController.country,
                  validator: (value) => ZValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                )),
                const SizedBox(height: ZSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: const Text('Save')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
