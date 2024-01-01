import 'package:e_commerce/core/constants/apptheme.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
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
}
