import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:get/get.dart';

class FinalAddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  String? lat;
  String? long;

  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
