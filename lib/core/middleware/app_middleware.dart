// ignore_for_file: non_constant_identifier_names, body_might_complete_normally_nullable

import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  AppServices appServices = Get.find();

  int? get Priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (appServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.home);
    }
    if (appServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
  }
}
