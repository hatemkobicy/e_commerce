// ignore_for_file: prefer_const_constructors,, avoid_unnecessary_containers

import 'package:e_commerce/controller/checkout_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/view/widgets/cheakout/Card_address.dart';
import 'package:e_commerce/view/widgets/cheakout/card_delivery.dart';
import 'package:e_commerce/view/widgets/cheakout/Cash_patmentmethod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
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
                          controller.choosePaymentMethod("0"); // cash
                        },
                        child: CashPaymentMethod(
                          isActive:
                              controller.paymentMethod == "0" ? true : false,
                          text: "Payment Cash       ",
                          icon1: Icons.attach_money_rounded,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      splashColor: AppColor.primery.withOpacity(0),
                      onTap: () {
                        controller.choosePaymentMethod("1"); //card
                      },
                      child: CashPaymentMethod(
                        isActive:
                            controller.paymentMethod == "1" ? true : false,
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
                              controller.chooseDeliveryType("0"); //0=> Delivery
                            },
                            child: CardDelivery(
                              image: AppImageAsset.delivery,
                              text: "Delivery",
                              isActive:
                                  controller.deliveryType == "0" ? true : false,
                            ),
                          ),
                          InkWell(
                            splashColor: const Color.fromARGB(0, 1, 60, 132),
                            onTap: () {
                              controller
                                  .chooseDeliveryType("1"); //1=> Pickup Point
                            },
                            child: CardDelivery(
                              image: AppImageAsset.point,
                              text: "Pickup point",
                              isActive:
                                  controller.deliveryType == "1" ? true : false,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    if (controller.deliveryType == "0")
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
                          SizedBox(
                            height: 10,
                          ),
                          if (controller.dataAddres.isEmpty)
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoute.addressadd);
                              },
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "Please Add Addres in setting \n Click Here",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        decorationColor: Colors.white),
                                  ),
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
              )),
    );
  }
}
