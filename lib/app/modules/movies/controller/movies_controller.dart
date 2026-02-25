import 'package:biblioteca_flutter/app/routes/app_routes.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController {
  MoviesController();

  void addNewMovie() {
    Get.toNamed(Routes.MOVIE_FORM);
  }
}
