// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/source/remote/forgetpassword/verfiycodereset_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  cheakcode();
  goToresetpassword(String verfictioncode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerfiCodeReset verfiCodeReset = VerfiCodeReset(Get.find());
 StatusRequest statusRequest = StatusRequest.none;
  String? email;

  @override
  cheakcode() {
    
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  goToresetpassword(verfictioncode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiCodeReset.postdata(email!, verfictioncode);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.resetpassword,arguments: {
          "email": email
        });
      } else {
        Get.defaultDialog(
            title: "Error", middleText: "The Code is not verfiy ");
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }
}
