import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';

class AddAddres extends StatelessWidget {
  const AddAddres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primery,
        centerTitle: true,
        title: const Text('New Addres'),
      ),
      body: Container(),
    );
  }
}
