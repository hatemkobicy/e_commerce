import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';

ThemeData englishtheme = ThemeData(
  fontFamily: "Roboto",
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        height: 2,
        fontSize: 16,
        color: AppColor.onboardingtextcolor),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  useMaterial3: true,
);




ThemeData arabictheme = ThemeData(
  fontFamily: "cairo",
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        height: 2,
        fontSize: 16,
        color: AppColor.onboardingtextcolor),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  useMaterial3: true,
);
