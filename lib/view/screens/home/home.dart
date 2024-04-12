// ignore_for_file: avoid_unnecessary_containers, unused_local_variable

import 'package:e_commerce/controller/fav_controller.dart';
import 'package:e_commerce/controller/homepage_controller.dart';
import 'package:e_commerce/controller/offers_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/data/model/itemsview_model.dart';
import 'package:e_commerce/view/widgets/home/bestoffers_listitems.dart';
import 'package:e_commerce/view/widgets/home/custome_hometext.dart';
import 'package:e_commerce/view/widgets/home/custome_listcategorise.dart';
import 'package:e_commerce/view/widgets/home/custome_listitems.dart';
import 'package:e_commerce/view/widgets/home/custome_searchbar.dart';
import 'package:e_commerce/view/widgets/home/custome_slider.dart';
import 'package:e_commerce/view/widgets/searche_listitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    Get.put(OffersController());
    FavoriteController controllerfav = Get.put(FavoriteController());
    return Scaffold(
      backgroundColor: AppColor.primery,
      body: GetBuilder<HomePageControllerImp>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
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
                      const SizedBox(
                        height: 10,
                      ),
                      !controller.isSearch
                          ? const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomeImageSlider(),
                              CustomeCategoreiseList(),
                              SizedBox(
                                height: 10,
                              ),
                              CustomeHomeText(
                                hometext: 'Top Selling',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomeItemsList(),
                              CustomeHomeText(
                                hometext: 'Best Offers',
                              ),
                              BestOffersItemsList(),
                            ],
                          )
                          : ListItemsSearch(
                              listdatamodel: controller.listdata)
                    ],
                  ),
                ),
              )),
    );
  }
}

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        return InkWell(
            onTap: () {
              controller.gotoprouductdetiles(listdatamodel[index]);
            },
            child: CustomSearchListView(
              price: '${listdatamodel[index].itemspricediscount}',
              title: '${listdatamodel[index].itemsName}',
              imagename: '${listdatamodel[index].itemsImage}',
            ));
      }),
    );
  }
}
