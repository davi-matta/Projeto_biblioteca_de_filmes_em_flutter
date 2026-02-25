import 'package:biblioteca_flutter/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  MyController() {
    // TODO: implement MyController
    throw UnimplementedError();
  }

  RxBool isLoading = false.obs;

  void onInit() {
    super.onInit();
    _loadData();
  }

  void _loadData() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 5));
    isLoading.value = false;
    finishLoading();
  }
  goToHomePage(){
    Get.offAllNamed(Routes.HOME);
  }
  void finishLoading(){
    Future.microtask(() => goToHomePage());
  }
}
