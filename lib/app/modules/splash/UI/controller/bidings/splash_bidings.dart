
import 'package:biblioteca_flutter/app/modules/splash/UI/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashBidings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
