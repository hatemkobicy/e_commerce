import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChange(int index);
  gotologin();
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentpage = 0;

  AppServices appServices = Get.find();

  @override
  next() {
    currentpage++;
    if (currentpage > onBoardingList.length - 1) {
      appServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChange(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  gotologin() {
    appServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }
}
