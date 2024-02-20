// ignore_for_file: prefer_const_constructors,

import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/view/widgets/cheakout/Card_address.dart';
import 'package:e_commerce/view/widgets/cheakout/card_delivery.dart';
import 'package:e_commerce/view/widgets/cheakout/card_paymentmethod.dart';
import 'package:e_commerce/view/widgets/cheakout/Cash_patmentmethod.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
          child: Text(
            "CheakOut",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        child: ListView(
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
            CashPaymentMethod(isActive: true,),
            const SizedBox(
              height: 15,
            ),
            CardPaymentMethod(isActive: false,),
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
                  CardDelivery(image: AppImageAsset.delivery, text: "Delivery",isActive: false,),
                  CardDelivery(image: AppImageAsset.point, text: "Pickup point", isActive: true)
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "Choose Your Addres ",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            CardAddress(name: 'name', suptitle: "suptitle", isActive: true,),
            CardAddress(name: 'name', suptitle: "suptitle", isActive: false,),
            
          ],
        ),
      ),
    );
  }
}
