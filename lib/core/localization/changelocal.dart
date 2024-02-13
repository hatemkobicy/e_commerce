import 'package:e_commerce/core/constants/apptheme.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;
  ThemeData apptheme = englishtheme;

  AppServices appServices = Get.find();

  changeLang(String langcode) {
    Locale local = Locale(langcode);
    apptheme = langcode == "ar" ? arabictheme : englishtheme;
    Get.changeTheme(apptheme);
    appServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(local);
  }

  @override
  void onInit() {
    requestpermissionLocation();
    String? sheardprefLang = appServices.sharedPreferences.getString("lang");
    if (sheardprefLang == "ar") {
      language = const Locale("ar");
      apptheme = arabictheme;
    } else if (sheardprefLang == "en") {
      language = const Locale("en");
      apptheme = englishtheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      apptheme = englishtheme;
    }
    super.onInit();
  }

  requestpermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Get.snackbar("Location Permission",
          "Location services are not enabled Please Enable it");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Get.snackbar(
            "Location permissions", "Location permissions are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("Location permissions",
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
