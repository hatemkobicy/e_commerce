import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:flutter/material.dart';

class CardDelivery extends StatelessWidget {
  final String image;
  final String text;
  final bool isActive;
  const CardDelivery({super.key, required this.image, required this.text, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isActive == true
              ? const Color.fromARGB(255, 83, 219, 253)
              : AppColor.primery,
          border: Border.all(
              color: isActive == true
                  ? const Color.fromARGB(255, 83, 219, 253)
                  : AppColor.primery,
              width: 1.7),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Image.asset(
            image,
            width: 160,
          ),
          Text(
            text,
            style: TextStyle(color: isActive == true
                  ? Colors.black
                  : Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
