import 'package:e_commerce/controller/home_navbar_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenNav extends StatelessWidget {
  const HomeScreenNav({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeNavControllerImp());
    return GetBuilder<HomeNavControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: AppColor.backgroundcolor1,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          height: 70,
          child: Row(
            children: [
              MaterialButton(
                shape: const CircleBorder(),
                onPressed: () {
                  controller.changePage(0);
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      size: 25,
                      color: Colors.white,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
              MaterialButton(
                shape: const CircleBorder(),
                onPressed: () {
                  controller.changePage(1);
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.category,
                      size: 25,
                      color: Colors.white,
                    ),
                    Text(
                      "Category",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  MaterialButton(
                    shape: const CircleBorder(),
                    onPressed: () {
                      controller.changePage(2);
                    },
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 25,
                          color: Colors.white,
                        ),
                        Text(
                          "Favorite",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    shape: const CircleBorder(),
                    onPressed: () {
                      controller.changePage(3);
                    },
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.settings,
                          size: 25,
                          color: Colors.white,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: AppColor.primery,
        body: controller.listpage.elementAt(controller.correntpage),
      ),
    );
  }
}
