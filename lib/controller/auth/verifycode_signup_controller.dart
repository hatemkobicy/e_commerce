// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/source/remote/auth/verfiycode_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeControllerSignup extends GetxController {
  cheakcode();
  goTosuccessSignup(String verfiycode);
  String? email;
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());
  StatusRequest? statusRequest;
}

class VerifyCodeSignupControllerImp extends VerifyCodeControllerSignup {

  @override
  cheakcode() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  goTosuccessSignup(String verfiycode) async {
    
      statusRequest = StatusRequest.loading;
      update();
      var response = await verfiyCodeSignUpData.postdata(email!, verfiycode);
      print("===================== $response control");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.successSignup);
        } else {
          Get.defaultDialog(title: "Error", middleText: "The Code is not verfiy ");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }

    reSend(){
      verfiyCodeSignUpData.resendData(email!);
    }
  }

