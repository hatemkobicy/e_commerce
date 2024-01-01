import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mbuttons extends StatelessWidget {
  final String? label;
  final Color? color;
  final Color? tcolor;
  final double? width;
  final double? height;
  void Function()? onPressed;

  Mbuttons(
      {Key? key, required this.label, this.onPressed, this.color, this.tcolor, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ,
      width: width,
      child: MaterialButton(
        height: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        textColor: tcolor,
        color: color,
        onPressed: onPressed,
        child: Text(
          label!,
          style: const TextStyle(
            fontSize: 16,
            
          ),
        ),
      ),
    );
  }
}
