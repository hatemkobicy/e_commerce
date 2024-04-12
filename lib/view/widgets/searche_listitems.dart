// ignore_for_file: unused_local_variable, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/homepage_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchListView extends StatelessWidget {
  final String price;
  final String imagename;
  final String title;
  const CustomSearchListView({
    super.key,
    required this.price,
    required this.title,
    required this.imagename,
  });

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp controllerImp = Get.put(HomePageControllerImp());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: AppColor.backgroundcolor1,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: 120,
                          imageUrl: "${AppLink.imageitems}/$imagename",
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        subtitle: Text(
                          price + "\$",
                          style: const TextStyle(color: Colors.white),
                        ),
                        title: Text(
                          title,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
