import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddres extends StatelessWidget {
  const ViewAddres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Get.toNamed(AppRoute.addressadd);
      },child: Icon(Icons.add),),
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primery,
        centerTitle: true,
        title: const Text('My Address'),
      ),
      body: Container(),
    );
  }
}
