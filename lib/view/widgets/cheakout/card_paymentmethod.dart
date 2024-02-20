import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethod extends StatelessWidget {
  final bool isActive;
  const CardPaymentMethod({super.key, required this.isActive});

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
        children: const [
          Text(
            "Payment Cards      ",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.payment_outlined,
            color: Color.fromARGB(255, 197, 244, 54),
          ),
        ],
      ),
    );
  }
}
