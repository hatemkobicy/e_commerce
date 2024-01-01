import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/data/source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeSlider extends GetView<OnBoardingControllerImp> {
  const CustomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChange(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
          children: [
            Text(
              onBoardingList[i].title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              onBoardingList[i].image,
              width: 331,
              height: 250,
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                onBoardingList[i].body,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
