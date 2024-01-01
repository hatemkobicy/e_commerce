import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  viewfav(int id) async {
    var response = await crud.postData(AppLink.myfavorite,
        {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
  deletefav(int id) async {
    var response =
        await crud.postData(AppLink.deletefavorite, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
