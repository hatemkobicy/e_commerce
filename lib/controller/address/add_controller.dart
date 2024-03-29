import 'dart:async';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? completercontroller;
  Position? postion;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? lat;
  double? long;

  addMarker(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  getCurrentLocation() async {
    postion = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(postion!.latitude, postion!.longitude),
      zoom: 13.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  gotoFinalAddres() {
    Get.toNamed(AppRoute.finaladdress, arguments: {
      "lat": lat.toString(),
      "long": long.toString(),
    });
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
