import 'package:e_commerce/controller/orders/details_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
        child: ListView(
          children: [
            Card(
              color: AppColor.backgroundcolor1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Table(
                      children: [
                        TableRow(children: [
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
                        ]),
                        TableRow(
                          children: [
                            Text(
                              "Lenovo ideapad gaming 3",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "2",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              "1000\$",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Total Price : 2000\$",
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
            Card(
              color: AppColor.backgroundcolor1,
              child: Container(
                child: ListTile(
                  title: Text(
                    "Shipping Addres :",
                    style: TextStyle(color: AppColor.primery),
                  ),
                  subtitle: Text(
                    "Damascous ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
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
                    controller.completercontroller!.complete(controllermap);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
