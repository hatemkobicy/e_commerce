import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/data/model/categorise_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeCategoreiseListItems extends GetView<ItemsControllerImp> {
  const CustomeCategoreiseListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 10,
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

class Categorise extends GetView<ItemsControllerImp> {
  final int? i;
  final CategoriesModel categoriesModel;
  const Categorise({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: const Color.fromARGB(0, 244, 67, 54),
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        controller.changeCat(i!);
        controller.getItems(
            categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          GetBuilder<ItemsControllerImp>(builder: (controller) => Container(
            padding: const EdgeInsets.all(5),
            decoration: controller.selectedcat == i
                ? BoxDecoration(
                    color: AppColor.backgroundcolor1,
                    border: Border.all(
                      color: AppColor.backgroundcolor1,
                    ),
                    borderRadius: BorderRadius.circular(25))
                : BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(25)),
            child: Text(
              "${categoriesModel.categoriesName}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
          ),),
          
        ],
      ),
    );
  }
}
