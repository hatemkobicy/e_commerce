// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/source/remote/forgetpassword/resetpassword_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  newpassword();
  goToSuccess();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest? statusRequest;
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;

  @override
  newpassword() {}

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  @override
  goToSuccess() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Error", middleText: "The Password is not Match repassword");
    } else {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(
        email!,
        password.text,
      );
      print("===================== $response control");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //  data.addAll(response['data']);
          Get.offAllNamed(AppRoute.successresetpassword);
        } else {
          Get.defaultDialog(title: "Error", middleText: "Try Agian");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
}
