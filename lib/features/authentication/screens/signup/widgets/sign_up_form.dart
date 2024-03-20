import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/signup_controller.dart';
import 'terms_and_conditions_checkbox.dart';

class ZSignUpForm extends StatelessWidget {
  const ZSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignUpController());
    return Form(
      key: signUpController.signupFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ZSizes.spaceBtwSections),
        child: Column(
          children: [
            /// First Name & Last Name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: signUpController.firstName,
                    validator: (value) => ZValidator.validateEmptyText(value, 'First Name'),
                    expands: false,
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: ZTexts.firstName),
                  ),
                ),
                const SizedBox(width: ZSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: signUpController.lastName,
                    validator: (value) => ZValidator.validateEmptyText(value, 'Last Name'),
                    expands: false,
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: ZTexts.lastName),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ZSizes.spaceBtwInputFields),

            /// Username
            TextFormField(
                controller: signUpController.username,
                validator: (value) => ZValidator.validateEmptyText(value, 'Username'),
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user_edit), labelText: ZTexts.username)),
            const SizedBox(height: ZSizes.spaceBtwInputFields),

            /// Email
            TextFormField(
                validator: (value) => ZValidator.validateEmail(value),
                controller: signUpController.email,
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct), labelText: ZTexts.email)),
            const SizedBox(height: ZSizes.spaceBtwInputFields),

            /// Phone Number
            TextFormField(
                validator: (value) => ZValidator.validatePhoneNumber(value),
                controller: signUpController.phoneNumber,
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.call), labelText: ZTexts.phoneNo)),
            const SizedBox(height: ZSizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => TextFormField(
                validator: (value) => ZValidator.validatePassword(value),
                controller: signUpController.password,
                obscureText: signUpController.hidePassword.value,
                decoration: InputDecoration(
                  labelText: ZTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => signUpController.hidePassword.value = !signUpController.hidePassword.value,
                    icon: Icon(signUpController.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwSections),

            /// Terms&Conditions Checkbox
            const TermsAndConditionsCheckbox(),
            const SizedBox(height: ZSizes.spaceBtwSections),

            /// Sign Up Button
            SizedBox(
                width: double.infinity, child: ElevatedButton(onPressed: () => signUpController.signup(), child: const Text(ZTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
