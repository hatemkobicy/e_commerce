// ignore_for_file: prefer_const_constructors,

import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
        title: const Text('Title'),
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 60),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 83, 219, 253),
                  borderRadius: BorderRadius.circular(10)),
              child: const Row(
                children: [
                  Text(
                    "Payment Cash       ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.attach_money_rounded,
                    color: Color.fromARGB(204, 21, 53, 100),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 60),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
              decoration: BoxDecoration(
                  color: AppColor.backgroundcolor1,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: const [
                  Text(
                    "Payment Cards      ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.payment_outlined,
                    color: Color.fromARGB(255, 197, 244, 54),
                  ),
                ],
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
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Image.asset(
                          AppImageAsset.delivery,
                          width: 160,
                        ),
                        Text(
                          "Delivery",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.onboardingcolor,
                        border: Border.all(
                            color: AppColor.onboardingcolor, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Image.asset(
                          AppImageAsset.point,
                          width: 160,
                        ),
                        Text(
                          "Pickup point",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
