// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/model/cart_model.dart';
import 'package:e_commerce/data/model/orders_model.dart';
import 'package:e_commerce/data/source/remote/orders/details_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;
  Position? postion;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? lat;
  double? long;
  Completer<GoogleMapController>? completercontroller;

  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  initaldata() {
    if(ordersModel.ordersType == 0){
      kGooglePlex = CameraPosition(
        target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
        zoom: 12,
      );
      markers.add(Marker(
          markerId: MarkerId("1"),
          position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!)));
    }
    
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersDetailsData.getDetails(ordersModel.ordersId!);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersmodel"];
    initaldata();
    getData();
    super.onInit();
  }
}
