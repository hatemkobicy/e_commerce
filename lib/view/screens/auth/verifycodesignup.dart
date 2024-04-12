// ignore_for_file: sized_box_for_whitespace

import 'package:e_commerce/controller/auth/verifycode_signup_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/view/widgets/Buttons/mbuttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class VerfiyCodeSignup extends StatelessWidget {
  const VerfiyCodeSignup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignupControllerImp());
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primery,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<VerifyCodeSignupControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Verification Code',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Sent To Email:\n ${controller.email}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: OtpTextField(
                          cursorColor: Colors.white,
                          numberOfFields: 5,
                          borderColor: const Color(0xFF512DA8),
                          textStyle: const TextStyle(
                              fontSize: 20, color: Colors.white),
                          onSubmit: (String verfiycode) {
                            controller.goTosuccessSignup(verfiycode);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 280,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: OtpTimerButton(
                          height: 50,
                          radius: 5,
                          backgroundColor:
                              const Color.fromARGB(130, 117, 173, 242),
                          onPressed: () {
                            controller.reSend();
                          },
                          text: const Text(
                            "Resend Code",
                            style: TextStyle(color: Colors.white),
                          ),
                          duration: 60,
                        ),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
