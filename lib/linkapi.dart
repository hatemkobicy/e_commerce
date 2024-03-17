class AppLink {
  static String server = "https://hatemkobicy.site/ecommercy";
  static String test = "$server/test.php";
  static String image = "https://hatemkobicy.site/ecommercy/upload";

  //====================image============================
  static String imagecategories = "$image/categories";
  static String imageitems = "$image/items";

  //====================Auth============================

  static String signUp = "$server/auth/signup.php";
  static String verfiyCode = "$server/auth/verfiycode.php";
  static String login = "$server/auth/login.php";
  static String resendcode = "$server/auth/resendcode.php";

  //====================forgetpassword============================

  static String cheakemail = "$server/forgetpassword/cheakemail.php";
  static String verfiyCodereset = "$server/forgetpassword/verfiycodereset.php";
  static String resetpassword = "$server/forgetpassword/resetpassword.php";

  //====================Home============================
  static String home = "$server/home.php";
  //====================items============================
  static String items = "$server/items/items.php";
  static String search = "$server/items/search.php";
  //====================favorite============================
  static String addfavorite = "$server/favorite/add.php";
  static String removefavorite = "$server/favorite/remove.php";
  static String myfavorite = "$server/favorite/view.php";
  static String deletefavorite = "$server/favorite/deletfromefav.php";
  //====================cart============================
  static String addcart = "$server/cart/addcart.php";
  static String deletecart = "$server/cart/deletecart.php";
  static String viewcart = "$server/cart/viewcart.php";
  static String getcountitems = "$server/cart/getcountitems.php";
  //====================coupon============================
  static String checkcoupon = "$server/coupon/checkcoupon.php";
  //====================address============================
  static String addAddres = "$server/address/add.php";
  static String viewAddres = "$server/address/view.php";
  static String deleteAddres = "$server/address/delete.php";
  static String editAddres = "$server/address/edit.php";
  //====================cheakout============================
  static String checkout = "$server/orders/add_orders.php";
  static String ordersPending = "$server/orders/view_orders.php";

}
  

