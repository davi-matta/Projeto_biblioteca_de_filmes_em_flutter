import 'package:biblioteca_flutter/app/modules/movies/model/movies_model.dart';
import 'package:biblioteca_flutter/app/modules/movies/repository/movie_repository.dart';
import 'package:biblioteca_flutter/app/modules/movies/service/image_service.dart';
import 'package:biblioteca_flutter/app/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MoviesController extends GetxController {
  MoviesController();

  final MovieRepository _repository = MovieRepository();
  

  
  
  
  final ImagePicker picker = ImagePicker();
  final ValueNotifier<XFile?> imageNotifier = ValueNotifier<XFile?>(null);
  @override
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
