import 'package:e_commerce/controller/address/finaladd_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/view/widgets/Buttons/mbuttons.dart';
import 'package:e_commerce/view/widgets/textform/custometextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FinalAddres extends StatelessWidget {
  const FinalAddres({super.key});

  @override
  Widget build(BuildContext context) {
    FinalAddAddressController controllerpage =
        Get.put(FinalAddAddressController());
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primery,
        centerTitle: true,
        title: const Text('Complate Addres'),
      ),
      body: GetBuilder<FinalAddAddressController>(
        builder: (controller) => controllerpage.statusRequest ==
                StatusRequest.loading
            ? Center(child: LottieBuilder.asset(AppImageAsset.loading))
            : ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: TextFormField(
                      controller: controllerpage.street,
                      
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
                        hintText: "Street name",
                        prefixIcon: const Icon(
                          Icons.streetview_rounded,
                          color: AppColor.onboardingcolor,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(130, 117, 173, 242),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: TextFormField(
                      controller: controllerpage.city,
                      
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
                        hintText: "city name",
                        prefixIcon: const Icon(
                          Icons.location_city_rounded,
                          color: AppColor.onboardingcolor,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(130, 117, 173, 242),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: TextFormField(
                      controller: controllerpage.name,
                      
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
                        hintText: "Addres name",
                        prefixIcon: const Icon(
                          Icons.person_pin_circle_rounded,
                          color: AppColor.onboardingcolor,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(130, 117, 173, 242),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 400,
                  ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(40),
                      color: AppColor.backgroundcolor1,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 60,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(40)),
                      onPressed: () {
                        controllerpage.addAddres();
                      },
                      child: Text(
                        "Save Addres",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
