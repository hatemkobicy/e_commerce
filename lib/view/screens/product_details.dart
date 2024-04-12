import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/productdetails_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:e_commerce/view/widgets/itemsdetails/items_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(40),
          color: AppColor.backgroundcolor1,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 60,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(40)),
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          child: const Text(
            "Go To Cert",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor1,
        foregroundColor: Colors.white,
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          decoration: const BoxDecoration(
                              color: AppColor.backgroundcolor1,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(25))),
                        ),
                        Center(
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imageitems}/${controller.itemsModel.itemsImage!}",
                            height: 300,
                          ),
                        ),
                      ],
                    ),
                    CustomeItemsDetails(
                      count: "${controller.countitems}",
                      onadd: () {
                        controller.add();
                      },
                      onremove: () {
                        controller.remove();
                      },
                    ),
                  ],
                ),
              )),
    );
  }
}
