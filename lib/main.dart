import 'package:biblioteca_flutter/app/routes/app_pages.dart';
import 'package:biblioteca_flutter/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
  GetMaterialApp(
    initialRoute: Routes.SPLASH, getPages: AppPages.routes,
  ));
}



