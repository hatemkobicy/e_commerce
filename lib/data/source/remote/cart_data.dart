import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class CartData {
Crud crud;
CartData(this.crud);

addcart(int usersid, int itemsid) async {
var response = await crud.postData(AppLink.addcart,
{"usersid": usersid.toString(), "itemsid": itemsid.toString()});
return response.fold((l) => l, (r) => r);
}

deletecart(int usersid, int itemsid) async {
var response = await crud.postData(AppLink.deletecart,
{"usersid": usersid.toString(), "itemsid": itemsid.toString()});
return response.fold((l) => l, (r) => r);
}

getcountitems(int usersid, int itemsid) async {
var response = await crud.postData(AppLink.getcountitems,
{"usersid": usersid.toString(), "itemsid": itemsid.toString()});
return response.fold((l) => l, (r) => r);
}

cartview(int usersid) async {
var response = await crud.postData(AppLink.viewcart,
{"usersid": usersid.toString()});
return response.fold((l) => l, (r) => r);
}

cheakCoupon(String couponname) async {
var response = await crud.postData(AppLink.checkcoupon,
{"couponname": couponname});
return response.fold((l) => l, (r) => r);
}



}