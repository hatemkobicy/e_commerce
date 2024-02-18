import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/source/remote/addresData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinalAddAddressController extends GetxController {
  StatusRequest? statusRequest;
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  String? lat;
  String? long;

  Addressdata addressdata = Addressdata(Get.find());

  

  AppServices appServices = Get.find();

  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);
  }

  addAddres() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressdata.addData(
      appServices.sharedPreferences.getInt("id")!,
      name!.text,
      city!.text,
      street!.text,
      lat!,
      long!,
    );
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homescreen);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
