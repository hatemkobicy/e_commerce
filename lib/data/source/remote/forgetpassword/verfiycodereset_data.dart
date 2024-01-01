import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class VerfiCodeReset {
  Crud crud;
  VerfiCodeReset(this.crud);

  postdata(
    String email,
    String verfiycode,
  ) async {
    var response = await crud.postData(AppLink.verfiyCodereset, {
      "email": email,
      "verfiycode": verfiycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
