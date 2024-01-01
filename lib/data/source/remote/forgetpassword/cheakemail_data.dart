import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class CheakEmailData {
  Crud crud;
  CheakEmailData(this.crud);

  postdata(
    String email,
  ) async {
    var response = await crud.postData(AppLink.cheakemail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
