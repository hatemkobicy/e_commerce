import 'dart:io';

cheakInternet() async {
  try {
    var resualt = await InternetAddress.lookup("google.com");
    if (resualt.isNotEmpty && resualt[0].rawAddress.isNotEmpty) {
      return true;
    }
  }on SocketException catch (_) {
    return false;
  }
}
