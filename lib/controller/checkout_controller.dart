import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:e_commerce/data/source/remote/addresData.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  Addressdata addressdata = Get.put(Addressdata(Get.find()));
  StatusRequest? statusRequest;
  AppServices appServices = Get.find();
  String? paymentMethod;
  String? deliveryType;
  int? addresID;
  List<AddressModel> dataAddres = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseAddres(int val) {
    addresID = val;
    update();
  }

  getShipAddress() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addressdata.viewData(appServices.sharedPreferences.getInt("id")!);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataAddres.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getShipAddress();
    super.onInit();
  }
}
