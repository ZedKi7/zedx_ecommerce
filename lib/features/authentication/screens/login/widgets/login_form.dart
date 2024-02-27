import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../password_configuration/forget_password.dart';
import '../../signup/signup.dart';

class ZLoginForm extends StatelessWidget {
  const ZLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ZSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: ZTexts.email)),
            const SizedBox(height: ZSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
                decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: ZTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
            )),
            const SizedBox(height: ZSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(ZTexts.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(onPressed: () => Get.to(() => const ForgetPasswordScreen()), child: const Text(ZTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: ZSizes.spaceBtwSections),

            /// SignIn Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.offAll(() => const NavigationMenu()), child: const Text(ZTexts.signIn)),
            ),
            const SizedBox(height: ZSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                child: const Text(ZTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
