import 'package:get/get.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/models/product_model.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/orders/orders.dart';
import '../features/shop/screens/product_details/product_details.dart';
import '../features/shop/screens/product_reviews/product_reviews.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/wishlist/wishlist.dart';
import 'routes.dart';

class ZAppRoutes {
  static final pages = [
    GetPage(name: ZRoutes.home, page: () => const HomeScreen()),
    GetPage(name: ZRoutes.store, page: () => const StoreScreen()),
    GetPage(name: ZRoutes.favourites, page: () => const FavoriteScreen()),
    GetPage(name: ZRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: ZRoutes.productDetails, page: () => ProductDetailsScreen(product: ProductModel.empty())),
    GetPage(name: ZRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: ZRoutes.order, page: () => const OrdersScreen()),
    GetPage(name: ZRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: ZRoutes.cart, page: () => const CartScreen()),
    GetPage(name: ZRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: ZRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: ZRoutes.signUp, page: () => const SignUpScreen()),
    GetPage(name: ZRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: ZRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: ZRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: ZRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
