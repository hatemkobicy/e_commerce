// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/source/remote/auth/login_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  AppServices appServices = Get.find();

  LoginData loginData = LoginData(Get.find());

  late TextEditingController email;
  late TextEditingController password;
  IconData passwordicon1 = Icons.remove_red_eye;
 late StatusRequest statusRequest;

  bool isshowpassword = true;
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    if (isshowpassword == true) {
      passwordicon1 = Icons.visibility;
    } else {
      passwordicon1 = Icons.visibility_off;
    }
    update();
  }

  changeicon() {}

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("===================== $response control");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == 1) {
            appServices.sharedPreferences
                .setInt("id", response['data']['users_id']);
            appServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            appServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            appServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            appServices.sharedPreferences.setString("step", "2");
            //  data.addAll(response['data']);
            Get.offNamed(AppRoute.home);
          } else {
            Get.toNamed(AppRoute.verficodesignup, arguments: {"email":email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Error", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print('token==========$value');
    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
