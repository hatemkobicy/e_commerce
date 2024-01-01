import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addfavorite(int usersid, int  itemsid) async {
    var response = await crud.postData(AppLink.addfavorite,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removefavorite(int usersid, int itemsid) async {
    var response = await crud.postData(AppLink.removefavorite,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
