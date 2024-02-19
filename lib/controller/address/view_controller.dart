import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:e_commerce/data/source/remote/addresData.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  late StatusRequest statusRequest;
  Addressdata addressdata = Addressdata(Get.find());
  AppServices appServices = Get.find();
  List<AddressModel> data = [];

  viewData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addressdata.viewData(appServices.sharedPreferences.getInt("id")!);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(int addressid) {
    addressdata.deleteData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  @override
  void onInit() {
    viewData();
    super.onInit();
  }
}
