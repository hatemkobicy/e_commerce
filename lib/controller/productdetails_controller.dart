// ignore_for_file: must_call_super, avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/itemsview_model.dart';
import 'package:e_commerce/data/source/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());
  late ItemsModel itemsModel;
  int countitems = 0;
   late StatusRequest statusRequest;
  AppServices appServices = Get.find();
  CartData cartData = CartData(Get.find());

  initalData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountitems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  add() {
    addcart(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      deletecart(itemsModel.itemsId!);
      countitems--;
    }
    update();
  }

  addcart(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addcart(
        appServices.sharedPreferences.getInt("id")!, itemsid);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            duration: const Duration(milliseconds: 70),
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColor.backgroundcolor1,
            title: "Notifection",
            messageText: const Text(
              "Done , Add to Cart",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletecart(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deletecart(
        appServices.sharedPreferences.getInt("id")!, itemsid);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            duration: const Duration(milliseconds: 70),
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColor.backgroundcolor1,
            title: "Notifection",
            messageText: const Text(
              "Done , Delete to Cart",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountitems(itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getcountitems(
        appServices.sharedPreferences.getInt("id")!, itemsid);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = response['data'];
        print("======$countitems");
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initalData();
  }
}
