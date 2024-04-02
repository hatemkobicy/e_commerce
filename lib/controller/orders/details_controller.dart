import 'dart:async';

import 'package:e_commerce/data/model/orders_model.dart';
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

  initaldata() {
    kGooglePlex = CameraPosition(
      target: LatLng(12.5435135, 14.546513),
      zoom: 6.4746,
    );
  }

  @override
  void onInit() {
    initaldata();
    ordersModel = Get.arguments["ordersmodel"];
    super.onInit();
  }
}
