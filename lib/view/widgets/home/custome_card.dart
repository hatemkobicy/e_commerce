import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';

class CustomeCardSlide extends StatelessWidget {
  final String maintext;
  final String subtext;
  const CustomeCardSlide({super.key, required this.maintext, required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.backgroundcolor1,
            ),
            height: 150,
            child:  ListTile(
              title: Text(
                maintext,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                subtext,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: -15,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: AppColor.primery,
                  borderRadius: BorderRadius.circular(160)),
            ),
          )
        ],
      ),
    );
  }
}
