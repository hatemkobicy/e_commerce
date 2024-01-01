import 'package:e_commerce/controller/home_navbar_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreenNav extends StatelessWidget {
  const HomeScreenNav({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeNavControllerImp());
    return GetBuilder<HomeNavControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.primery,
        body: controller.listpage.elementAt(controller.correntpage),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColor.primery,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: AppColor.backgroundcolor1.withOpacity(0.8),
                color: Colors.white,
                tabs: [
                  GButton(
                    onPressed: (){
                      controller.changePage(0);
                    },
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    onPressed: () {
                      controller.changePage(1);
                    },
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                  GButton(
                    onPressed: ()async {
                      controller.cartController.refreshPage();
                    await  controller.changePage(2);
                    },
                    icon: Icons.shopping_basket_rounded,
                    text: 'Cart',
                  ),
                  GButton(
                    onPressed: () {
                      controller.changePage(3);
                    },
                    icon: Icons.settings,
                    text: 'Setting',
                  ),
                ],
                selectedIndex: controller.correntpage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
