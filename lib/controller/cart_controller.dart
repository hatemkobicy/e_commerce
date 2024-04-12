// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/cart_model.dart';
import 'package:e_commerce/data/model/coupon_mode.dart';
import 'package:e_commerce/data/source/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;
  List<CartModel> data = [];
  couponModel? couponmodel;
  int discountcoupon = 0;
  String? couponname;
  String? couponid;
  AppServices appServices = Get.find();
  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());
  int priceorders = 0;
  String totalcountitems = "0";

  viewcart() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var response =
        await cartData.cartview(appServices.sharedPreferences.getInt("id")!);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List datarespones = response['datacart']['data'];
          Map dataresponescountprice = response['countprice'];
          data.clear();
          data.addAll(datarespones.map((e) => CartModel.fromJson(e)));
          totalcountitems = dataresponescountprice['totalcount'].toString();
          priceorders = dataresponescountprice['totalprice'];
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToCheckout() {
    if (data.isEmpty) return Get.snackbar("Hello", "Cart is empty");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceordrs": priceorders.toString(),
      "discountcoupon": discountcoupon.toString(),
    });
  }

  resetVarCart() {
    totalcountitems = "0";
    priceorders = 0;
  }

  getTotalPrice() {
    return (priceorders - priceorders * discountcoupon / 100);
  }

  refreshPage() {
    resetVarCart();
    viewcart();
  }

  cheakCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.cheakCoupon(controllercoupon!.text);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponmodel = couponModel.fromJson(datacoupon);
        discountcoupon = couponmodel!.couponDiscount!;
        couponname = couponmodel!.couponName;
        couponid = couponmodel!.couponId.toString();
        // data.addAll(response['data']);
      } else {
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("Error", "The Coupon is uncorrect",colorText: Colors.white,);
      }
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    viewcart();
    super.onInit();
  }
}
