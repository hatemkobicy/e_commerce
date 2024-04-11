import 'package:e_commerce/controller/orders/pending_controllers.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/data/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersPendingController controller = Get.put(OrdersPendingController());
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primery,
        centerTitle: true,
        title: const Text('My Orders'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersPendingController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => CardOrderList(
                listdata: controller.data[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardOrderList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrderList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.onboardingcolor,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Number : ${listdata.ordersId}",
                  style: const TextStyle(fontSize: 16),
                ),
                Text("${controller.printorderstatus(listdata.oedersStatus!)}")
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Text(
                "Order Type : ${controller.printTypeOrder(listdata.ordersType!)}"),
            Text("Order Price : ${listdata.ordersPrice}\$"),
            Text("Delivery Price : ${listdata.ordersPricedelivery}\$"),
            Text(
                "Payment Method : ${controller.printpaymentmethod(listdata.ordersPaymentmethod!)}"),
            const Divider(
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Total Price : ${listdata.ordersTotalprice}\$",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersDetails, arguments: {
                      "ordersmodel": listdata,
                    });
                  },
                  child: const Text(
                    "Details",
                    style: TextStyle(
                        color: Color.fromARGB(255, 27, 7, 247),
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                if (listdata.oedersStatus! == 0)
                  TextButton(
                    onPressed: () {
                      controller.deleteOrders(listdata.ordersId);
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
