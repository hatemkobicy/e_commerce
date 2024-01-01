import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialservices() async {
 // await Firebase.initializeApp();
  await Get.putAsync(() => AppServices().init());
}
