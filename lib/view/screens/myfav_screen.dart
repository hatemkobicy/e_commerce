import 'package:e_commerce/controller/myfav_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/view/widgets/myfav/cardview_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyfavoriteController());
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        title: const Text("My Favorite"),
        backgroundColor: AppColor.primery,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: GetBuilder<MyfavoriteController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.64, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return CustomeCardFav(
                            favoritemodel: controller.data[index],
                          );
                        }),
                  ],
                ),
              )),
    );
  }
}
