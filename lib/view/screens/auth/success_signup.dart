// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/view/widgets/Buttons/mbuttons.dart';
import 'package:get/get.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primery,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(
                    height: 104,
                  ),
                  Container(
                      alignment: AlignmentDirectional.center,
                      child:
                          const Image(image: AssetImage(AppImageAsset.logo))),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: const Text(
                      'Success SignUp',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    child: const Icon(
                      Icons.thumb_up_rounded,
                      size: 140,
                      color: AppColor.onboardingcolor,
                    ),
                  ),
                  const SizedBox(
                    height: 140,
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Mbuttons(
                    height: 43,
                    width: double.infinity,
                    label: "15".tr,
                    color: AppColor.onboardingcolor,
                    tcolor: AppColor.primery,
                    onPressed: () {
                      Get.offNamed(AppRoute.login);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
