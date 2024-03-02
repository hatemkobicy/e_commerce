import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:e_commerce/data/source/remote/addresData.dart';
import 'package:e_commerce/data/source/remote/checkout_data.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  Addressdata addressdata = Get.put(Addressdata(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  StatusRequest? statusRequest;
  AppServices appServices = Get.find();
  String? paymentMethod;
  String? deliveryType;
  int? addresID;
  List<AddressModel> dataAddres = [];
  late String couponid;
  late String priceorders;

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

  checkout() async {
    statusRequest = StatusRequest.loading;
    Map data = {
      "usersid": appServices.sharedPreferences.getInt("id")!.toString(),
      "addressid": addresID.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "40",
      "ordersprice": priceorders,
      "couponid": couponid,
      "paymentmethod": paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data);
    print("===================== $response control");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("doneeeee");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceordrs'];
    getShipAddress();
    super.onInit();
  }
}
