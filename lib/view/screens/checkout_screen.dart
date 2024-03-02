// ignore_for_file: prefer_const_constructors,

import 'package:e_commerce/controller/checkout_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/view/widgets/cheakout/Card_address.dart';
import 'package:e_commerce/view/widgets/cheakout/card_delivery.dart';
import 'package:e_commerce/view/widgets/cheakout/Cash_patmentmethod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controller = Get.put(CheckOutController());
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primery,
        foregroundColor: Colors.white,
        title: const Text('Make Some Choices'),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
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
            controller.checkout();
          },
          child: Text(
            "CheckOut",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<CheckOutController>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? Center(child: LottieBuilder.asset(AppImageAsset.loadding))
            : ListView(
                children: [
                  const Center(
                    child: Text(
                      "Choose Your payment Method",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                      splashColor: AppColor.primery.withOpacity(0),
                      onTap: () {
                        controller.choosePaymentMethod("cash");
                      },
                      child: CashPaymentMethod(
                        isActive:
                            controller.paymentMethod == "cash" ? true : false,
                        text: "Payment Cash       ",
                        icon1: Icons.attach_money_rounded,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    splashColor: AppColor.primery.withOpacity(0),
                    onTap: () {
                      controller.choosePaymentMethod("card");
                    },
                    child: CashPaymentMethod(
                      isActive:
                          controller.paymentMethod == "card" ? true : false,
                      text: 'Payment Cards      ',
                      icon1: Icons.credit_card,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      "Choose Your Shipped Method",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      children: [
                        InkWell(
                          splashColor: AppColor.primery.withOpacity(0),
                          onTap: () {
                            controller.chooseDeliveryType("Delivery");
                          },
                          child: CardDelivery(
                            image: AppImageAsset.delivery,
                            text: "Delivery",
                            isActive: controller.deliveryType == "Delivery"
                                ? true
                                : false,
                          ),
                        ),
                        InkWell(
                          splashColor: const Color.fromARGB(0, 1, 60, 132),
                          onTap: () {
                            controller.chooseDeliveryType("Pickup point");
                          },
                          child: CardDelivery(
                            image: AppImageAsset.point,
                            text: "Pickup point",
                            isActive: controller.deliveryType == "Pickup point"
                                ? true
                                : false,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  if (controller.deliveryType == "Delivery")
                    Column(
                      children: [
                        Center(
                          child: Text(
                            "Choose Your Addres ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ...List.generate(
                          controller.dataAddres.length,
                          (index) => InkWell(
                            splashColor: const Color.fromARGB(0, 255, 193, 7),
                            onTap: () {
                              controller.chooseAddres(
                                  controller.dataAddres[index].addressId!);
                            },
                            child: CardAddress(
                              name:
                                  '${controller.dataAddres[index].addressName}',
                              suptitle:
                                  '${controller.dataAddres[index].addressCity}\n${controller.dataAddres[index].addressStreet}',
                              isActive: controller.addresID ==
                                      controller.dataAddres[index].addressId
                                  ? true
                                  : false,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
      ),
    );
  }
}
