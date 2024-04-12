// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/orders_model.dart';
import 'package:e_commerce/data/source/remote/orders/orders_data.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
  late StatusRequest statusRequest;
  late OrdersModel ordersModel;
  List<OrdersModel> data = [];
  AppServices appServices = Get.find();

  String printTypeOrder(int val) {
    if (val == 0) {
      return "Delivery";
    } else {
      return "Pickup Point";
    }
  }

  String printpaymentmethod(int val) {
    if (val == 0) {
      return "Cash";
    } else {
      return "Card";
    }
  }

  String printorderstatus(int val) {
    if (val == 0) {
      return "Waitting Approve...";
    } else if (val == 1) {
      return "Preparing...";
    } else if (val == 2) {
      return "On The Way";
    } else {
      return "Delivered";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await ordersPendingData
        .getData(appServices.sharedPreferences.getInt("id")!);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteOrders(id) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await ordersPendingData.deleteData(id);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrders() {
    getOrders();
  }

  @override
  void onInit() {
    refreshOrders();
    super.onInit();
  }
}
