// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:e_commerce/data/source/remote/addresData.dart';
import 'package:e_commerce/data/source/remote/checkout_data.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  Addressdata addressdata = Get.put(Addressdata(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  late StatusRequest statusRequest;
  AppServices appServices = Get.find();
  String? paymentMethod;
  String? deliveryType;
  int addresID = 0;
  List<AddressModel> dataAddres = [];
  late String couponid;
  late String priceorders;
  late String coupondiscount;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseAddres(int val) {
    addresID = val;
    update();
  }

  getShipAddress() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addressdata.viewData(appServices.sharedPreferences.getInt("id")!);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataAddres.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addresID = dataAddres[0].addressId!;
      } else {
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please Select a Payment Methods");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please Select a Shipped Method");
    }
    if (dataAddres.isEmpty) {
      return Get.snackbar("Error", "Please Add Addres to Ship");
    }

    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid": appServices.sharedPreferences.getInt("id")!.toString(),
      "addressid": addresID.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "40",
      "ordersprice": priceorders,
      "couponid": couponid,
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homescreen);
        Get.snackbar("Success", "the order is done we sent email to you");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "Please Try Again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceordrs'];
    coupondiscount = Get.arguments['discountcoupon'];

    getShipAddress();
    super.onInit();
  }
}
