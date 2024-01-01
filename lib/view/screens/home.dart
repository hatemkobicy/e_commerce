// ignore_for_file: avoid_unnecessary_containers

import 'package:e_commerce/controller/homepage_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/data/model/itemsview_model.dart';
import 'package:e_commerce/view/widgets/home/custome_card.dart';
import 'package:e_commerce/view/widgets/home/custome_hometext.dart';
import 'package:e_commerce/view/widgets/home/custome_listcategorise.dart';
import 'package:e_commerce/view/widgets/home/custome_listitems.dart';
import 'package:e_commerce/view/widgets/home/custome_searchbar.dart';
import 'package:e_commerce/view/widgets/searche_listitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? Center(child: LottieBuilder.asset(AppImageAsset.loadding))
          : Container(
              child: ListView(
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
                      ? const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomeCardSlide(
                                maintext: "A Summer Surprise ",
                                subtext: "Cash Back 30%"),
                            CustomeCategoreiseList(),
                            SizedBox(
                              height: 10,
                            ),
                            CustomeHomeText(
                              hometext: 'Product For You',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomeItemsList(),
                            CustomeHomeText(
                              hometext: 'Best Offers',
                            ),
                            CustomeItemsList(),
                          ],
                        )
                      : ListItemsSearch(listdatamodel: controller.listdata)
                ],
              ),
            ),
    );
  }
}

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        return InkWell(
            onTap: () {
              controller.gotoprouductdetiles(listdatamodel[index]);
            },
            child: CustomSearchListView(
              price: '${listdatamodel[index].itemsPrice}',
              title: '${listdatamodel[index].itemsName}',
              imagename: '${listdatamodel[index].itemsImage}',
            ));
      }),
    );
  }
}
