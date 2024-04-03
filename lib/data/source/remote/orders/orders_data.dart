import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData(int usersid) async {
    var response = await crud
        .postData(AppLink.ordersPending, {"usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(int id) async {
    var response =
        await crud.postData(AppLink.ordersDelete, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
