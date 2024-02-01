import 'package:e_commerce/core/class/statusrequest.dart';
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
  AppServices appServices = Get.find();
  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());
  int priceorders = 0;
  var totalcountitems;

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
          totalcountitems = dataresponescountprice['totalcount'];
          priceorders = dataresponescountprice['totalprice'];
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
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
        // data.addAll(response['data']);
      } else {
        discountcoupon = 0;
        couponname = null;
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
