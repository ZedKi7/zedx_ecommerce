import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/login/login_controller.dart';
import '../../password_configuration/forget_password.dart';
import '../../signup/signup.dart';

class ZLoginForm extends StatelessWidget {
  const ZLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Form(
      key: loginController.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ZSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: loginController.email,
              validator: (value) => ZValidator.validateEmail(value),
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: ZTexts.email),
            ),
            const SizedBox(height: ZSizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => TextFormField(
                validator: (value) => ZValidator.validatePassword(value),
                controller: loginController.password,
                obscureText: loginController.hidePassword.value,
                decoration: InputDecoration(
                  labelText: ZTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => loginController.hidePassword.value = !loginController.hidePassword.value,
                    icon: Icon(loginController.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: loginController.rememberMe.value = !loginController.rememberMe.value,
                        onChanged: (value) => loginController.rememberMe.value = !loginController.rememberMe.value,
                      ),
                    ),
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
              child: ElevatedButton(onPressed: () => loginController.singInWithEmailAndPassword(), child: const Text(ZTexts.signIn)),
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
