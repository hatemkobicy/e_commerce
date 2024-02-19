import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Addressdata {
  Crud crud;
  Addressdata(this.crud);

  viewData(int usersid) async {
    var response = await crud.postData(AppLink.viewAddres, {
      "usersid": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(int usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLink.addAddres, {
      "usersid": usersid.toString(),
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(int addressid) async {
    var response = await crud
        .postData(AppLink.deleteAddres, {"addressid": addressid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  editData() async {
    var response = await crud.postData(AppLink.editAddres, {});
    return response.fold((l) => l, (r) => r);
  }
}
