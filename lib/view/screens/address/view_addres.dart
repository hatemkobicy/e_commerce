import 'dart:ffi';

import 'package:e_commerce/controller/address/view_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ViewAddres extends StatelessWidget {
  const ViewAddres({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressadd);
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: AppColor.primery,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primery,
        centerTitle: true,
        title: const Text('My Address'),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? Center(child: LottieBuilder.asset(AppImageAsset.loadding))
            : ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardAddres(
                    addressModel: controller.data[index],
                    ondelete: () {
                      controller.deleteData(controller.data[index].addressId!);
                    },
                  );
                },
              ),
      ),
    );
  }
}

class CardAddres extends StatelessWidget {
  final void Function()? ondelete;
  final AddressModel addressModel;
  const CardAddres({super.key, required this.addressModel, this.ondelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.onboardingcolor,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          subtitle: Text(
            "City : ${addressModel.addressCity} \nStreet : ${addressModel.addressStreet}",
          ),
          title: Text("${addressModel.addressName}"),
          trailing: IconButton(
              onPressed: ondelete,
              icon: Icon(
                Icons.delete_sweep_outlined,
                size: 35,
              )),
        ),
      ),
    );
  }
}
