import 'package:biblioteca_flutter/app/routes/app_pages.dart';
import 'package:biblioteca_flutter/app/routes/app_routes.dart';
import 'package:biblioteca_flutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
); 
  runApp(
  GetMaterialApp(
    initialRoute: Routes.SPLASH, getPages: AppPages.routes,
  ));
}



