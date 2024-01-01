import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/homepage_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/data/model/itemsview_model.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeItemsList extends GetView<HomePageControllerImp> {
  const CustomeItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: 200,
      child: ListView.builder(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return ItemsHome(
            itemsModel: ItemsModel.fromJson(controller.items[i]),
          );
        },
      ),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          height: 175,
          width: 250,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 175,
              width: 250,
              fit: BoxFit.fitHeight,
              imageUrl: '${AppLink.imageitems}/${itemsModel.itemsImage}',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            color: AppColor.backgroundcolor1.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          height: 195,
          width: 242,
        ),
        Positioned(
          left: 35,
          bottom: 10,
          child: Text(
            "${itemsModel.itemsName}",
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
