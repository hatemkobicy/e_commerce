// ignore_for_file: unused_local_variable, avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/favorite_model.dart';
import 'package:e_commerce/data/model/itemsview_model.dart';
import 'package:e_commerce/data/source/remote/myfavorite_date.dart';
import 'package:get/get.dart';

class MyfavoriteController extends GetxController {
  List<Favoritemodel> data = [];
  AppServices appServices = Get.find();
  List<ItemsModel> listdata = [];

   StatusRequest? statusRequest;
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData
        .viewfav(appServices.sharedPreferences.getInt("id")!);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => Favoritemodel.fromJson(e)));

        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletefav(favid) {
    //data.clear();
    //statusRequest = StatusRequest.loading;
    var response = myFavoriteData.deletefav(favid);
    //print("===================== $response control");
    // statusRequest = handlingData(response);
    // if (StatusRequest.success == statusRequest) {
    //  if (response['status'] == "success") {
    data.removeWhere((element) => element.favoriteId == favid);
    //  } else {
    //    statusRequest = StatusRequest.failure;
    //}
    // }
    update();
  }

  

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
