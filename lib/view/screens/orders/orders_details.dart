import 'package:e_commerce/controller/orders/details_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primery,
        centerTitle: true,
        title: const Text('Orders Details'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<OrdersDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Card(
                  color: AppColor.backgroundcolor1,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              decoration: UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                      color: AppColor.primery, width: 3)),
                              children: [
                                Text(
                                  "Item",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.primery,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Count",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.primery,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.primery,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(
                                decoration: UnderlineTabIndicator(
                                    borderSide:
                                        BorderSide(color: AppColor.primery)),
                                children: [
                                  Text(
                                    "${controller.data[index].itemsName}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "${controller.data[index].countitems}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  Text(
                                    "${controller.data[index].itemsPrice}\$",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Total Price : ${controller.ordersModel.ordersTotalprice}\$",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.ordersModel.ordersType == 0)
                  Card(
                    color: AppColor.backgroundcolor1,
                    child: Container(
                      child: ListTile(
                        title: Text(
                          "Shipping Addres :",
                          style: TextStyle(color: AppColor.primery),
                        ),
                        subtitle: Text(
                          "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet!}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 5,
                ),
                if (controller.ordersModel.ordersType == 0)
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.backgroundcolor1,
                        borderRadius: BorderRadius.circular(20)),
                    height: 300,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GoogleMap(
                        markers: controller.markers.toSet(),
                        mapType: MapType.normal,
                        initialCameraPosition: controller.kGooglePlex!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controller.completercontroller!
                              .complete(controllermap);
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
