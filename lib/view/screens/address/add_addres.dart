import 'package:e_commerce/controller/address/add_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

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
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? Center(child: LottieBuilder.asset(AppImageAsset.loadding))
              : Column(
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
                                color: Color.fromARGB(193, 1, 60, 132),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              height: 60,
                              child: MaterialButton(
                                
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(40)),
                                onPressed: () {
                                  controllerpage.gotoFinalAddres();
                                },
                                child: Text(
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
        ),
      ),
    );
  }
}
