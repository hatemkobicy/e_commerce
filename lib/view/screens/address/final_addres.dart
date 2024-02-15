import 'package:e_commerce/controller/address/finaladd_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinalAddres extends StatelessWidget {
  const FinalAddres({super.key});

  @override
  Widget build(BuildContext context) {
    FinalAddAddressController controller = Get.put(FinalAddAddressController());
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primery,
        centerTitle: true,
        title: const Text('Complate Addres'),
      ),
      body: Container(),
    );
  }
}
