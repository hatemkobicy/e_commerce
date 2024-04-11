import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:e_commerce/controller/auth/signin_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: AppColor.primery,
      body: SafeArea(
        child: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: Center(
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  Container(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: const Image(
                                          image:
                                              AssetImage(AppImageAsset.logo))),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      '10'.tr,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '11'.tr,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 105,
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
                                      hintText: "12".tr,
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        color: AppColor.onboardingcolor,
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          130, 117, 173, 242),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 1, horizontal: 15),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  GetBuilder<LoginControllerImp>(
                                    builder: (controller) => CustomeTextForm(
                                      obscureText: controller.isshowpassword,
                                      valid: (val) {
                                        return validInput(
                                            val!, 30, 8, "password");
                                      },
                                      controller: controller.password,
                                      keyboardType:
                                          TextInputType.visiblePassword,
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
                                        hintText: "13".tr,
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            controller.showpassword();
                                          },
                                          child: Icon(
                                            controller.passwordicon1,
                                            color: AppColor.onboardingcolor,
                                          ),
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: AppColor.onboardingcolor,
                                        ),
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            130, 117, 173, 242),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 5,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 1),
                                    alignment: AlignmentDirectional.topEnd,
                                    child: TextButton(
                                      child: Text(
                                        "14".tr,
                                        style: const TextStyle(
                                            color: AppColor.onboardingcolor,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor:
                                                AppColor.onboardingcolor,
                                            decorationThickness: 1),
                                      ),
                                      onPressed: () {
                                        Get.toNamed(AppRoute.forgetpassword);
                                      },
                                    ),
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
                                      controller.login();
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    width: double.infinity,
                                    child: MaterialButton(
                                      height: 40,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      textColor: AppColor.primery,
                                      color: const Color.fromARGB(
                                          130, 117, 173, 242),
                                      onPressed: () {
                                        Get.offNamed(AppRoute.signup);
                                      },
                                      child: Text(
                                        "16".tr,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: AppColor.primery),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
