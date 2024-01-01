import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/view/screens/cart_screen.dart';
import 'package:e_commerce/view/screens/home.dart';
import 'package:e_commerce/view/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeNavController extends GetxController {
  changePage(int i);
}

class HomeNavControllerImp extends HomeNavController {
  CartController cartController = Get.put(CartController());
  int correntpage = 0;

  List<Widget> listpage = [
    const HomeScreen(),
    const Center(child: Text("Setting"),),
    const CartScreen(),
    const SettingScreen(),
  ];

  @override
  changePage(int i) {
    correntpage = i;
    update();
  }
}
