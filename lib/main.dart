import 'package:e_commerce/Binding/initialbinding.dart';
import 'package:e_commerce/core/localization/app_translation.dart';
import 'package:e_commerce/core/localization/changelocal.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
      translations: AppTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.apptheme,
      initialBinding: InitialBinding(),
      //home: const AppLanguage(),
      // routes: routes,
      getPages: routes,
    );
  }
}
