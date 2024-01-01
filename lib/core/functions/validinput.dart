import 'package:get/get.dart';

validInput(String val, int max, int min, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not valid UserName";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not valid Email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not valid PhoneNumber";
    }
  }
  if (val.isEmpty) {
    return " Can't be Empty";
  }
  if (val.length < min) {
    return " Can't be less than $min";
  }
  if (val.length > max) {
    return " Can't be Larger than $max";
  }
}
