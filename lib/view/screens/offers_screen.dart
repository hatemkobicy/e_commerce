// ignore_for_file: unused_local_variable

import 'package:e_commerce/controller/fav_controller.dart';
import 'package:e_commerce/controller/offers_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/view/screens/home/home.dart';
import 'package:e_commerce/view/widgets/home/custome_searchbar.dart';
import 'package:e_commerce/view/widgets/offers/customecard_offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerfav = Get.put(FavoriteController());

    return Scaffold(
      backgroundColor: AppColor.primery,
      body: GetBuilder<OffersController>(
          builder: (controller) => ListView(
                children: [
                  CustomeSearchBar(
                    searchcontroller: controller.search,
                    onChanged: (val) {
                      controller.cheaksearch(val);
                    },
                    onpresssearch: () {
                      controller.onSearchItems();
                    },
                    hinttext: 'Search Here',
                    onPressediconfav: () {
                      Get.toNamed(AppRoute.myfav);
                    },
                  ),
                  !controller.isSearch
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) =>
                                  CustomeCardOffers(
                                itemsModel: controller.data[index],
                              ),
                            ),
                          ))
                      : ListItemsSearch(listdatamodel: controller.listdata)
                ],
              )),
    );
  }
}
