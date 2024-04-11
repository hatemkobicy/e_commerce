import 'package:e_commerce/controller/settings_controller.dart';
import 'package:e_commerce/core/constants/color.dart';
import 'package:e_commerce/core/constants/imageassets.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.height / 4,
              color: AppColor.backgroundcolor1,
            ),
            Positioned(
              top: Get.height / 7.5,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: AppColor.primery,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage(AppImageAsset.person),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.height / 6.5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            color: AppColor.backgroundcolor1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {},
                  title: Text("Change Language"),
                  trailing: Icon(
                    Icons.language_sharp,
                    color: AppColor.primery,
                  ),
                ),
                const Divider(
                  color: AppColor.primery,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.orderspending);
                  },
                  title: Text("My Orders"),
                  trailing: Icon(
                    Icons.shopping_cart_checkout_outlined,
                    color: AppColor.primery,
                  ),
                ),
                const Divider(
                  color: AppColor.primery,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressview);
                  },
                  title: Text("My Adress"),
                  trailing: Icon(
                    Icons.location_on_sharp,
                    color: AppColor.primery,
                  ),
                ),
                Divider(
                  color: AppColor.primery,
                ),
                ListTile(
                  onTap: () {},
                  title: Text("About Us"),
                  trailing: Icon(
                    Icons.people,
                    color: AppColor.primery,
                  ),
                ),
                const Divider(
                  color: AppColor.primery,
                ),
                ListTile(
                  onTap: () {
                    launchUrl(Uri.parse("https://wa.me/qr/4JACY3QPQA3RE1"));
                  },
                  title: Text("Contact Us"),
                  trailing: Icon(
                    Icons.contact_support,
                    color: AppColor.primery,
                  ),
                ),
                const Divider(
                  color: AppColor.primery,
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text("Logout"),
                  trailing: Icon(
                    Icons.exit_to_app,
                    color: AppColor.primery,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
