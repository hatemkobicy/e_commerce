import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);

  getDetails(int id) async {
    var response = await crud
        .postData(AppLink.ordersDetails, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
