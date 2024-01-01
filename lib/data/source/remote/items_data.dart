import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String id, int userid) async {
    var response = await crud
        .postData(AppLink.items, {"id": id.toString(), "usersid" : userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
