import 'package:e_commerce/controller/homepage_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/data/model/categorise_model.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomeCategoreiseList extends GetView<HomePageControllerImp> {
  const CustomeCategoreiseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 110,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 8,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categorise(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categorise extends GetView<HomePageControllerImp> {
  final int? i;
  final CategoriesModel categoriesModel;
  const Categorise({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        controller.gotoItems(
            controller.categories, i!, categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: AppColor.backgroundcolor1,
                borderRadius: BorderRadius.circular(15)),
            height: 68,
            width: 68,
            child: SvgPicture.network(
              "${AppLink.imagecategories}/${categoriesModel.categoriesImage}",
              color: AppColor.primery,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            "${categoriesModel.categoriesName}",
            style: const TextStyle(color: Colors.white, fontSize: 14,),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
