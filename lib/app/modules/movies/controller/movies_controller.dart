import 'package:biblioteca_flutter/app/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MoviesController extends GetxController {
  MoviesController();

  final ImagePicker picker = ImagePicker();
  final ValueNotifier<XFile?> imageNotifier = ValueNotifier<XFile?>(null);

  addNewMovie() {
    Get.toNamed(Routes.MOVIE_FORM);
  }

  final Map<String, String> movie = {
    'title': '',
    'description': '',
    'directors': '',
    'synopsis': '',
    'image': '',
  };
  
  get movieForm => null;

  Future<void> pickImage() async {
  try {
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      imageNotifier.value = picked;
      movieForm['image'] = picked.path;
    }
  } catch (e) {
    print('Erro ao selecionar imagem: $e');
  }
  }
}
