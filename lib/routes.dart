// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/core/middleware/app_middleware.dart';
import 'package:e_commerce/view/screens/address/add_addres.dart';
import 'package:e_commerce/view/screens/address/final_addres.dart';
import 'package:e_commerce/view/screens/address/view_addres.dart';
import 'package:e_commerce/view/screens/auth/forgetpassword/success_resetpassword.dart';
import 'package:e_commerce/view/screens/auth/success_signup.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/view/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:e_commerce/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:e_commerce/view/screens/auth/signup_screen.dart';
import 'package:e_commerce/view/screens/auth/forgetpassword/verifycode.dart';
import 'package:e_commerce/view/screens/cart/cart_screen.dart';
import 'package:e_commerce/view/screens/checkout_screen.dart';
import 'package:e_commerce/view/screens/home/home_screen.dart';
import 'package:e_commerce/view/screens/items.dart';
import 'package:e_commerce/view/screens/language.dart';
import 'package:e_commerce/view/screens/myfav_screen.dart';
import 'package:e_commerce/view/screens/onboarding.dart';
import 'package:e_commerce/view/screens/orders/orders_details.dart';
import 'package:e_commerce/view/screens/orders/orders_pending.dart';
import 'package:e_commerce/view/screens/product_details.dart';
import 'package:e_commerce/view/screens/auth/verifycodesignup.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const AppLanguage(),
      middlewares: [Mymiddleware()]),
  //  GetPage(name: "/",page: () => const AppLanguage(),),

  GetPage(
    name: AppRoute.login,
    page: () => const LoginPage(),
    transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(name: AppRoute.itemspage, page: () => const ItemsPage()),
  GetPage(name: AppRoute.home, page: () => const HomeScreenNav()),
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  GetPage(
    name: AppRoute.signup,
    page: () => const SignUpPAge(),
    transition: Transition.leftToRight,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(name: AppRoute.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.cart, page: () => const CartScreen()),
  GetPage(name: AppRoute.resetpassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.verficode, page: () => const VerfiyCode()),
  GetPage(
      name: AppRoute.productdetails, page: () => const ProductDetailsPage()),
  GetPage(
      name: AppRoute.successresetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignup, page: () => const SuccessSignup()),
  //GetPage(name: AppRoute.cheakemail, page: () => const CheakEmail()),
  GetPage(name: AppRoute.verficodesignup, page: () => const VerfiyCodeSignup()),
  GetPage(name: AppRoute.myfav, page: () => const MyFavorite()),
  GetPage(name: AppRoute.addressview, page: () => const ViewAddres()),
  GetPage(name: AppRoute.addressadd, page: () => const AddAddres()),
  GetPage(name: AppRoute.checkout, page: () => const CheckOutScreen()),
  GetPage(name: AppRoute.finaladdress, page: () => const FinalAddres()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrdersDetails()),
];

// Map<String, Widget Function(BuildContext)> routees = {
//   AppRoute.login: (context) => const LoginPage(),
//   AppRoute.onboarding: (context) => const OnBoarding(),
//   AppRoute.signup: (context) => const SignUpPAge(),
//   AppRoute.forgetpassword: (context) => const ForgetPassword(),
//   AppRoute.resetpassword: (context) => const ResetPassword(),
//   AppRoute.verficode: (context) => const VerfiyCode(),
//   AppRoute.successresetpassword: (context) => const SuccessResetPassword(),
//   AppRoute.successSignup: (context) => const SuccessSignup(),
//   AppRoute.cheakemail: (context) => const CheakEmail(),
//   AppRoute.verficodesignup: (context) => const VerfiyCodeSignup(),
// };
