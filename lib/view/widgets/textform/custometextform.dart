import 'package:flutter/material.dart';

class CustomeTextForm extends StatelessWidget {
  final String? Function(String?)? valid;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final InputDecoration? decoration;
  final bool? obscureText;
  final void Function(String)? onChanged;
  const CustomeTextForm({
    super.key,
    this.valid,
    this.controller,
    required this.keyboardType,
    required this.style,
    this.decoration,
    this.obscureText, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText == null || obscureText == false ? false : true,
      validator: valid,
      controller: controller,
      keyboardType: keyboardType,
      style: style,
      decoration: decoration,
    );
  }
}
