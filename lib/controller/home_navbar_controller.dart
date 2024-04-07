import 'package:e_commerce/controller/productdetails_controller.dart';
import 'package:e_commerce/view/screens/cart/cart_screen.dart';
import 'package:e_commerce/view/screens/home/home.dart';
import 'package:e_commerce/view/screens/offers_screen.dart';
import 'package:e_commerce/view/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeNavController extends GetxController {
  changePage(int i);
}

class HomeNavControllerImp extends HomeNavController {
  int correntpage = 0;

  List<Widget> listpage = [
    const HomeScreen(),
    const OffersScreen(),
    const CartScreen(),
    const SettingScreen(),
  ];

  @override
  changePage(int i) {
    correntpage = i;
    update();
  }

  deletall() {
    Get.deleteAll();
  }
}
