import 'package:e_commerce/controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/view/widgets/Buttons/mbuttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primery,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: GetBuilder<ForgetPasswordControllerImp>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              'Enter Your Email To Reset Password',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
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
                              height: 450,
                            ),
                            Mbuttons(
                              height: 50,
                              width: double.infinity,
                              onPressed: () {
                                controller.cheakemail();
                              },
                              label: 'Reset Password',
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
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
