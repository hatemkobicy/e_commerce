import 'package:e_commerce/controller/fav_controller.dart';
import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/data/model/itemsview_model.dart';
import 'package:e_commerce/view/screens/home.dart';
import 'package:e_commerce/view/widgets/home/custome_searchbar.dart';
import 'package:e_commerce/view/widgets/items/custome_carditems.dart';
import 'package:e_commerce/view/widgets/items/listcategories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerfav = Get.put(FavoriteController());
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        title: const Text("Items"),
        backgroundColor: AppColor.primery,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Container(
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
              height: 15,
            ),
            CustomeCategoreiseListItems(),
            const SizedBox(
              height: 15,
            ),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => controller.statusRequest ==
                      StatusRequest.loading
                  ? Center(child: LottieBuilder.asset(AppImageAsset.loadding))
                  : !controller.isSearch
                      ? GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.64, crossAxisCount: 2),
                          itemBuilder: (BuildContext context, index) {
                            controllerfav.isFavorite[controller.data[index]
                                    ['items_id']] =
                                controller.data[index]['favorite'];
                            return CustomeCard(
                              itemsModel:
                                  ItemsModel.fromJson(controller.data[index]),
                            );
                          },
                        )
                      : ListItemsSearch(listdatamodel: controller.listdata),
            ),
          ],
        ),
      ),
    );
  }
}
