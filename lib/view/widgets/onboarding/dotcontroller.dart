import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/data/source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/color.dart';

class Dotcontroller extends StatelessWidget {
  const Dotcontroller({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.all(5),
              duration: const Duration(milliseconds: 800),
              height: 6,
              width: controller.currentpage == index ? 20 : 5,
              decoration: BoxDecoration(
                color: controller.currentpage == index
                    ? Colors.white
                    : AppColor.onboardingcolor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
