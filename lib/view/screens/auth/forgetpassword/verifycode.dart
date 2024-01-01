import 'package:e_commerce/controller/auth/forgetpassword/verifiycode_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/view/widgets/Buttons/mbuttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primery,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<VerifyCodeControllerImp>(
            builder: (controller) =>
                controller.statusRequest == StatusRequest.loading
                    ? LottieBuilder.asset(AppImageAsset.loadding)
                    : Center(
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
                                    fontSize: 20),
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
                              onSubmit: (String verfictioncode) {
                                controller.goToresetpassword(verfictioncode);
                              },
                            ),

                                //OTPTextField(
                                //  controller: controller.code,
                                //  length: 5,
                                //  width: MediaQuery.of(context).size.width,
                                //  fieldWidth: 30,
                                //  style: const TextStyle(fontSize: 20, color: Colors.white),
                                // textFieldAlignment: MainAxisAlignment.spaceAround,
                                //  fieldStyle: FieldStyle.underline,
                              ),
                              const SizedBox(
                                height: 450,
                              ),
                              Mbuttons(
                                height: 50,
                                width: double.infinity,
                                
                                label: 'Cheak Code',
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
                      ),
          ),
        ),
      ),
    );
  }
}
