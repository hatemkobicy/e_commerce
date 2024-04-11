import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  AppServices appServices = Get.find();
  StatusRequest? statusRequest;
  logout() {
    appServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
