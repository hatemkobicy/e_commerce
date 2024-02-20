import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';

class CashPaymentMethod extends StatelessWidget {
  final bool isActive;
  const CashPaymentMethod({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
      decoration: BoxDecoration(
          color:isActive==true? const Color.fromARGB(255, 83, 219, 253):AppColor.backgroundcolor1,
          borderRadius: BorderRadius.circular(10)),
      child: const Row(
        children: [
          Text(
            "Payment Cash       ",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.attach_money_rounded,
            color: Color.fromARGB(204, 21, 53, 100),
          ),
        ],
      ),
    );
  }
}
