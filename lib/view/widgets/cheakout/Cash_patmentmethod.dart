import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';

class CashPaymentMethod extends StatelessWidget {
  final bool isActive;
  final String text;
  final IconData icon1;
  const CashPaymentMethod(
      {super.key, required this.isActive, required this.text, required this.icon1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
      decoration: BoxDecoration(
          color: isActive == true
              ? const Color.fromARGB(255, 83, 219, 253)
              : AppColor.backgroundcolor1,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Icon(
            icon1,
            color: Color.fromARGB(255, 221, 255, 4),
          ),
        ],
      ),
    );
  }
}
