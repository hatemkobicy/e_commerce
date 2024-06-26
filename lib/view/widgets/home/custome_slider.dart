import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/data/source/static/static.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

class CustomeImageSlider extends StatelessWidget {
  const CustomeImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FanCarouselImageSlider(
        imagesLink: sliderimage,
        isAssets: true,
        sliderHeight: 300,
        indicatorActiveColor: AppColor.onboardingcolor,
        isClickable: true,
        currentItemShadow: const [
          BoxShadow(
              offset: Offset(1, 1),
              color: AppColor.onboardingcolor,
              blurRadius: 10),
          BoxShadow(
              offset: Offset(-1, -1),
              color: AppColor.onboardingcolor,
              blurRadius: 10)
        ],
        expandImageHeight: 650,
      ),
    );
  }
}
