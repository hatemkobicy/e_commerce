import 'package:e_commerce/controller/productdetails_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeItemsDetails extends GetView<ProductDetailsControllerImp> {
  final void Function()? onadd;
  final void Function()? onremove;
  final String count;
  const CustomeItemsDetails( {super.key,
    required this.onadd,
    required this.onremove,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${controller.itemsModel.itemsName}",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                "${controller.itemsModel.itemsPrice}\$",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: onremove,
                    icon: const Icon(
                      Icons.remove_circle,
                      color: AppColor.backgroundcolor1,
                    ),
                  ),
                  Text(
                    count,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  IconButton(
                    onPressed: onadd,
                    icon: const Icon(
                      Icons.add_circle,
                      color: AppColor.backgroundcolor1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${controller.itemsModel.itemsDesc}",
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
