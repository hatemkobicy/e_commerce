import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/controller/productdetails_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/view/widgets/cart/custom_listview.dart';
import 'package:e_commerce/view/widgets/cart/custom_pricenav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp productcontroller =
        Get.put(ProductDetailsControllerImp());
    CartController cartController = Get.put(CartController());
    return GetBuilder<CartController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: CustomPriceNav(
          price: '${cartController.priceorders}\$',
          shippingprice: '100\$',
          totalprice: '5000\$',
          message: '${controller.totalcountitems}',
        ),
        appBar: AppBar(
          title: const Text("My Cart"),
          backgroundColor: AppColor.primery,
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        backgroundColor: AppColor.primery,
        body: ListView(
          children: [
            ...List.generate(
              cartController.data.length,
              (index) => CustomListViewCart(
                price: '${cartController.data[index].cartitemsprice}',
                title: '${cartController.data[index].itemsName}',
                itemscount: '${cartController.data[index].itemscount}',
                onPressedadd: () async {
                  await productcontroller
                      .addcart(cartController.data[index].itemsId!);
                  cartController.refreshPage();
                },
                onPressedremove: () async {
                  await productcontroller
                      .deletecart(cartController.data[index].itemsId!);
                  cartController.refreshPage();
                },
                imagename: '${cartController.data[index].itemsImage}',
              ),
            )
          ],
        ),
      ),
    );
  }
}
