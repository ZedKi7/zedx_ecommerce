import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/forget_password/forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPasswordController = Get.put(ForgetPasswordController());

    return Scaffold(
      appBar: const ZAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(ZTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: ZSizes.spaceBtwItems),
            Text(ZTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: ZSizes.spaceBtwSections * 2),

            /// Text field
            Form(
              key: forgetPasswordController.forgetPasswordFormKey,
              child: TextFormField(
                controller: forgetPasswordController.email,
                validator: ZValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: ZTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => forgetPasswordController.sendPasswordResetEmail(),
                child: const Text(ZTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
