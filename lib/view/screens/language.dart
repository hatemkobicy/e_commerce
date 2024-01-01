import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/localization/changelocal.dart';
import 'package:e_commerce/view/widgets/Buttons/mbuttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLanguage extends GetView<LocalController> {
  const AppLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: const TextStyle(
                fontSize: 20,
                height: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            Mbuttons(
              width: 200,
              color: AppColor.primery,
              tcolor: Colors.white,
              label: "Arabic",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.onboarding);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Mbuttons(
              width: 200,
              color: AppColor.primery,
              tcolor: Colors.white,
              label: "English",
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoute.onboarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
