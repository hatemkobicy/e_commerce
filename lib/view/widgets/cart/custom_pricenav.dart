import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/gestures.dart';
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
            padding: EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
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
                                contentPadding: EdgeInsets.symmetric(
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
                                      BorderSide(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
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
                              child: Text(
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
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ))),
        Container(
          margin: EdgeInsets.only(bottom: 5, left: 15, right: 15, top: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(7)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Count",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Container(
                      child:  Text(
                        message,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Price",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      price,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Discount",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      discount,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20, left: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
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
                        style: TextStyle(
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
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 60,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(40)),
            onPressed: onPressed,
            child: Text(
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
