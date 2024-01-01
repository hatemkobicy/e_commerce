import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);

  postdata(String email, String verfiycode) async {
    var response = await crud.postData(AppLink.verfiyCode, {
      "email": email,
      "verfiycode": verfiycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resendcode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
