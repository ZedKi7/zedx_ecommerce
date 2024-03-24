import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/update_name_controller.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final updateNameController = Get.put(UpdateNameController());

    return Scaffold(
      /// Custom Appbar
      appBar: ZAppBar(showBackArrow: true, title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: ZSizes.spaceBtwSections),

            /// Text fields
            Form(
              key: updateNameController.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: updateNameController.firstName,
                    validator: (value) => ZValidator.validateEmptyText(value, 'First name'),
                    expands: false,
                    decoration: const InputDecoration(labelText: ZTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: ZSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: updateNameController.lastName,
                    validator: (value) => ZValidator.validateEmptyText(value, 'Last name'),
                    expands: false,
                    decoration: const InputDecoration(labelText: ZTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => updateNameController.updateUserName(), child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}
