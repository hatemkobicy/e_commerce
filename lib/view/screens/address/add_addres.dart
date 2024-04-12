// ignore_for_file: avoid_unnecessary_containers

import 'package:e_commerce/controller/address/add_controller.dart';
import 'package:e_commerce/core/class/handlingdataview.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddres extends StatelessWidget {
  const AddAddres({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerpage = Get.put(AddAddressController());
    return Scaffold(
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primery,
        centerTitle: true,
        title: const Text('New Addres'),
      ),
      body: Container(
        child: GetBuilder<AddAddressController>(
          builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: Column(
                    children: [
                      if (controllerpage.kGooglePlex != null)
                        Expanded(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GoogleMap(
                                onTap: (latlng) {
                                  controllerpage.addMarker(latlng);
                                },
                                markers: controllerpage.markers.toSet(),
                                mapType: MapType.normal,
                                initialCameraPosition:
                                    controllerpage.kGooglePlex!,
                                onMapCreated:
                                    (GoogleMapController controllermap) {
                                  controllerpage.completercontroller!
                                      .complete(controllermap);
                                },
                              ),
                              Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(40),
                                  color: const Color.fromARGB(193, 1, 60, 132),
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                height: 60,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(40)),
                                  onPressed: () {
                                    controllerpage.gotoFinalAddres();
                                  },
                                  child: const Text(
                                    "Pick Addres",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ) ,
        ),
      ),
    );
  }
}
