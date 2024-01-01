import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/view/screens/onboarding.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: EasySplashScreen(
        logoWidth: 50,
        logo: Image.asset(AppImageAsset.logo),
        title: const Text(
          "NL Market",
          style: TextStyle(
            
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColor.onboardingcolor,
        showLoader: true,
        loaderColor: Colors.white,
        navigator: const OnBoarding(),
        durationInSeconds: 3,
      ),
    );
  }
}
