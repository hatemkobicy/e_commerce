// ignore_for_file: avoid_print

import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/itemsview_model.dart';
import 'package:e_commerce/data/source/remote/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/class/statusrequest.dart';

abstract class HomePageController extends SearchController {
  initialData();
  getdata();
  gotoItems(List categories, int selectedcat, String categoryid);
}

class HomePageControllerImp extends HomePageController {
  HomeData homeData = HomeData(Get.find());
  AppServices appServices = Get.find();
  List data = [];
  List categories = [];
  List items = [];
  String? username;
  StatusRequest? statusRequest;

  @override
  initialData() {
    username = appServices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

 
  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  
  gotoprouductdetiles(ItemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": ItemsModel});
  }

  @override
  gotoItems(categories, selectedcat, categoryid) {
    Get.toNamed(AppRoute.itemspage, arguments: {
      "categories": categories,
      "selectedcat": selectedcat,
      "catid": categoryid
    });
  }
}


class SearchController extends GetxController{
  TextEditingController search =TextEditingController();
  bool isSearch = false;
  StatusRequest? statusRequest;
  HomeData homeData = HomeData(Get.find());
  List<ItemsModel> listdata = [];


  cheaksearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchdata();
    update();
  }

  gotoprouductdetiles(ItemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": ItemsModel});
  }

  searchdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search.text);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}