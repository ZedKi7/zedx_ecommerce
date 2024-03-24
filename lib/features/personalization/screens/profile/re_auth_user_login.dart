import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/user_controller.dart';

class ReAuthUserLoginScreen extends StatelessWidget {
  const ReAuthUserLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;

    return Scaffold(
      /// Custom Appbar
      appBar: const ZAppBar(showBackArrow: true, title: Text('Re-Authenticate User')),
      body: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: Form(
          key: userController.reAuthFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Email
              TextFormField(
                controller: userController.verifyEmail,
                validator: ZValidator.validateEmail,
                decoration: const InputDecoration(labelText: ZTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
              ),
              const SizedBox(height: ZSizes.spaceBtwInputFields),

              /// Password
              Obx(
                () => TextFormField(
                  validator: (value) => ZValidator.validateEmptyText(value, 'Password'),
                  controller: userController.verifyPassword,
                  obscureText: userController.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: ZTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => userController.hidePassword.value = !userController.hidePassword.value,
                      icon: Icon(userController.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: ZSizes.spaceBtwSections),

              /// Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => userController.reAuthEmailAndPasswordUser(), child: const Text('Verify')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
