import 'package:biblioteca_flutter/app/modules/movies/controller/movies_controller.dart';
import 'package:get/get.dart';

class MoviesBindings implements Bindings {
@override
void dependencies() {
  Get.lazyPut<MoviesController>(() => MoviesController());
  }
}