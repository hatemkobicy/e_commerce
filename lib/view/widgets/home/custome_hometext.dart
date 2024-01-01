import 'package:flutter/material.dart';

class CustomeHomeText extends StatelessWidget {
  final String hometext;
  const CustomeHomeText({super.key, required this.hometext});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:  Text(
        hometext,
        textAlign: TextAlign.start,
        style:const  TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
