// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/source/remote/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  SignUpData signUpData = SignUpData(Get.find());
  List data = [];

 StatusRequest statusRequest = StatusRequest.none;

  @override
  signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postdata(
          username.text, password.text, email.text, phone.text);
      print("===================== $response control");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //  data.addAll(response['data']);
          Get.offAllNamed(AppRoute.verficodesignup,arguments: {
            "email":email.text
          });
          Get.delete<SignUpControllerImp>();
        } else {
          Get.defaultDialog(title: "Error", middleText: "This email is using ");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    username.dispose();
    password.dispose();
    super.dispose();
  }
}
