// ignore_for_file: file_names

import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';

class CardAddress extends StatelessWidget {
  final String name;
  final String suptitle;
  final bool isActive;
  const CardAddress(
      {super.key,
      required this.name,
      required this.suptitle,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive == true
          ? const Color.fromARGB(255, 83, 219, 253)
          : AppColor.backgroundcolor1,
      margin: const EdgeInsets.only(top: 10,right: 10,left: 10),
      child: ListTile(
        
        subtitle: Text(
          suptitle,
          style: TextStyle(
              color: isActive == true ? Colors.black : Colors.white,
              fontSize: 14),
        ),
        title: Text(
          name,
          style: TextStyle(
              color: isActive == true ? Colors.black : Colors.white,
              fontSize: 16),
        ),
      ),
    );
  }
}
