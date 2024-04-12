// ignore_for_file: overridden_fields, annotate_overrides, avoid_print

import 'package:e_commerce/controller/homepage_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/itemsview_model.dart';
import 'package:e_commerce/data/source/remote/items_data.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initalData();
  changeCat(int val);
  getItems(String categoryid);
  gotoproduct(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchController {
  ItemsData itemsData = ItemsData(Get.find());
  late StatusRequest statusRequest;
  List categories = [];
  String? catid;
  int? selectedcat;
  List data = [];
  AppServices appServices = Get.find();

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  initalData() {
    categories = Get.arguments['categories'];
    selectedcat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  changeCat(val) {
    selectedcat = val;
    update();
  }

  getItems(
    categoryid,
  ) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryid, appServices.sharedPreferences.getInt("id")!);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotoproduct(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }
}
