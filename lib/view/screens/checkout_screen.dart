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
                        ),
                      ],
                    ),
                  ),
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
            Card(
              color: AppColor.onboardingcolor,
              margin: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  subtitle: Text(
                    "City : //",
                  ),
                  title: Text("//"),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_sweep_outlined,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: AppColor.onboardingcolor,
              margin: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  subtitle: Text(
                    "City : //",
                  ),
                  title: Text("//"),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_sweep_outlined,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
