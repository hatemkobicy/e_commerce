import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/view/widgets/onboarding/customebuttons.dart';
import 'package:e_commerce/view/widgets/onboarding/dotcontroller.dart';
import 'package:e_commerce/view/widgets/onboarding/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingControllerImp controller = Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      controller.gotologin();
                    },
                    child: Text(
                      '8'.tr,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    )),
              ],
            ),
            const CustomeSlider(),
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AppImageAsset.onBoardingback),
                  ),
                ),
                child: const Column(
                  children: [
                    SizedBox(height: 50),
                    Dotcontroller(),
                    SizedBox(height: 50),
                    CustomeBotton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
