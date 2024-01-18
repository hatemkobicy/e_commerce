import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';

class ViewAddres extends StatelessWidget {
  const ViewAddres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        title: const Text('My Address'),
      ),
      body: Container(),
    );
  }
}
