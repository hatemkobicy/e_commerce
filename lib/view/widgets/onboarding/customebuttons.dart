import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeBotton extends GetView<OnBoardingControllerImp> {
  const CustomeBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: FittedBox(
        child: FloatingActionButton.extended(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {
              controller.next();
            },
            label:  Text('9'.tr),
            icon: const Icon(
              Icons.arrow_forward,
              color: AppColor.onboardingcolor,
              size: 30,
            )),
      ),
    );
  }
}
