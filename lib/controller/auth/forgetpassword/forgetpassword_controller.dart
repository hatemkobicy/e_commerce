// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/source/remote/forgetpassword/cheakemail_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  cheakemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CheakEmailData cheakEmailData = CheakEmailData(Get.find());
 StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController email;

  @override
  cheakemail() async {
    
      statusRequest = StatusRequest.loading;
      update();
      var response = await cheakEmailData.postdata(email.text);
      print("===================== $response control");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //  data.addAll(response['data']);
          Get.toNamed(AppRoute.verficode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Error", middleText: "Email Not Found");
          statusRequest = StatusRequest.none;
        }
      }
      update();
    
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

 
}
