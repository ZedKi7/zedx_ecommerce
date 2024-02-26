import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../verify_email.dart';
import 'terms_and_conditions_checkbox.dart';

class ZSignUpForm extends StatelessWidget {
  const ZSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ZSizes.spaceBtwSections),
        child: Column(
          children: [
            /// First Name & Last Name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: ZTexts.firstName),
                  ),
                ),
                const SizedBox(width: ZSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: ZTexts.lastName),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ZSizes.spaceBtwInputFields),

            /// Username
            TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user_edit), labelText: ZTexts.username)),
            const SizedBox(height: ZSizes.spaceBtwInputFields),

            /// Email
            TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct), labelText: ZTexts.email)),
            const SizedBox(height: ZSizes.spaceBtwInputFields),

            /// Phone Number
            TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.call), labelText: ZTexts.phoneNo)),
            const SizedBox(height: ZSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: ZTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwSections),

            /// Terms&Conditions Checkbox
            const TermsAndConditionsCheckbox(),
            const SizedBox(height: ZSizes.spaceBtwSections),

            /// Sign Up Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Get.to(() => const VerifyEmailScreen()), child: const Text(ZTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
