// ignore_for_file: avoid_unnecessary_containers

import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPriceNav extends StatelessWidget {
  final String price;
  final String message;
  final String discount;
  final String totalprice;
  final TextEditingController? controllercoupon;
  final void Function()? onPressed;
  final void Function()? onPressedapply;
  const CustomPriceNav(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalprice,
      this.onPressed,
      required this.message,
      this.controllercoupon,
      this.onPressedapply});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
            child: GetBuilder<CartController>(
                builder: (controller) => controller.couponname == null
                    ? Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: controllercoupon,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                isDense: true,
                                alignLabelWithHint: true,
                                hintStyle: const TextStyle(
                                    height: 1,
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                                hintText: "Coupon Code",
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(6),
                              color: AppColor.backgroundcolor1,
                            ),
                            height: 42,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(40)),
                              onPressed: onPressedapply,
                              child: const Text(
                                "Apply",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        child: Text(
                          "Congratulations You Get  ${controller.discountcoupon}% Discount",
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ))),
        Container(
          margin: const EdgeInsets.only(bottom: 5, left: 15, right: 15, top: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(7)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Text(
                        "Count",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Container(
                      child:  Text(
                        message,
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Price",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      price,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Discount",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      discount,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        totalprice,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(40),
            color: AppColor.backgroundcolor1,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 60,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(40)),
            onPressed: onPressed,
            child: const Text(
              "Place The Order",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
      ],
    );
  }
}
