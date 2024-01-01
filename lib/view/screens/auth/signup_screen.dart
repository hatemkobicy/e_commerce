import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:e_commerce/controller/auth/signup_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/view/widgets/Buttons/mbuttons.dart';
import 'package:e_commerce/view/widgets/textform/custometextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpPAge extends StatelessWidget {
  const SignUpPAge({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primery,
      ),
      body: SafeArea(
        child: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: GetBuilder<SignUpControllerImp>(builder: (controller) =>
            controller.statusRequest == StatusRequest.loading ?
              LottieBuilder.asset(AppImageAsset.loadding)
           :Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Text(
                            '17'.tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                          const SizedBox(
                            height: 95,
                          ),
                          CustomeTextForm(
                            valid: (val) {
                              return validInput(val!, 35, 5, "username");
                            },
                            controller: controller.username,
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                              hintText: "18".tr,
                              prefixIcon: const Icon(
                                Icons.person,
                                color: AppColor.onboardingcolor,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(130, 117, 173, 242),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomeTextForm(
                            valid: (val) {
                              return validInput(val!, 75, 5, "email");
                            },
                            controller: controller.email,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                              hintText: "19".tr,
                              prefixIcon: const Icon(
                                Icons.mail,
                                color: AppColor.onboardingcolor,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(130, 117, 173, 242),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomeTextForm(
                            valid: (val) {
                              return validInput(val!, 15, 8, "phone");
                            },
                            controller: controller.phone,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                              hintText: "20".tr,
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: AppColor.onboardingcolor,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(130, 117, 173, 242),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomeTextForm(
                            valid: (val) {
                              return validInput(val!, 30, 8, "password");
                            },
                            controller: controller.password,
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                              hintText: "21".tr,
                              prefixIcon: const Icon(
                                Icons.password,
                                color: AppColor.onboardingcolor,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(130, 117, 173, 242),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 90,
                          ),
                          Mbuttons(
                            height: 50,
                            width: double.infinity,
                            onPressed: () {
                              controller.signup();
                            },
                            label: 'Create New Account',
                            color: AppColor.onboardingcolor,
                            tcolor: Colors.white,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Mbuttons(
                            height: 50,
                            width: double.infinity,
                            onPressed: () {
                              Get.offNamed(AppRoute.login);
                            },
                            label: 'Back to Login',
                            color: const Color.fromARGB(130, 117, 173, 242),
                            tcolor: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),),
        ),
      ),
    );
  }
}
