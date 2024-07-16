import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/orders/order_repository.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/controllers/address_controller.dart';
import '../../models/order_model.dart';
import 'cart_controller.dart';
import 'checkout_controller.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      ZLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      ZFullScreenLoader.openLoadingDialog('Processing your order', ZImages.pencilAnimation);

      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();

      Get.off(
        () => SuccessScreen(
          image: ZImages.orderCompletedAnimation,
          title: 'Payment Success!',
          subTitle: 'Your items will be shipped soon!',
          onPressed: () => Get.offAll(() => const NavigationMenu()),
        ),
      );
    } catch (e) {
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
