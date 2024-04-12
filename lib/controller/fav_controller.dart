// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/source/remote/fav_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  List data = [];
  AppServices appServices = Get.find();

  late StatusRequest statusRequest;
  FavoriteData favoriteData = FavoriteData(Get.find());
  Map isFavorite = {};
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addfavorite(itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addfavorite(
        appServices.sharedPreferences.getInt("id")!, itemsid);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            backgroundColor: AppColor.backgroundcolor1,
            title: "Notifection",
            messageText: const Text(
              "Done , Add to favorite",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removefavorite(itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removefavorite(
        appServices.sharedPreferences.getInt("id")!, itemsid);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            backgroundColor: AppColor.backgroundcolor1,
            title: "Notifection",
            messageText: const Text(
              "Done , remove from favorite",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ));

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
