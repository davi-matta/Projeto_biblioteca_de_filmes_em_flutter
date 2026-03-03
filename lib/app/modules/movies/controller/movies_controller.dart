import 'package:biblioteca_flutter/app/modules/movies/model/movies_model.dart';
import 'package:biblioteca_flutter/app/modules/movies/repository/movie_repository.dart';
import 'package:biblioteca_flutter/app/modules/movies/service/image_service.dart';
import 'package:biblioteca_flutter/app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MoviesController extends GetxController {
  MoviesController();

  final MovieRepository _repository = MovieRepository();
  final ImageService _imageService = ImageService();
  final RxList<Movie> movies = <Movie>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isProcessingImage = false.obs;
  
  final ImagePicker picker = ImagePicker();
  final ValueNotifier<XFile?> imageNotifier = ValueNotifier<XFile?>(null);
  final auth = FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
    loadMovies();
  }

  Future<void> loadMovies() async {
    try {
      isLoading.value = true;
      final fetchedMovies = await _repository.fetchMovies();
      movies.assignAll(fetchedMovies);
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao carregar filmes: $e');
    } finally {
      isLoading.value = false;
    }
  }

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

  Future<void> saveMovie() async {
  try {
    final newMovie = Movie(
      id: '',
      title: movieForm['title']!,
      description: movieForm['description']!,
      directors: movieForm['directors']!,
      synopsis: movieForm['synopsis']!,
      imageBase64: (movieForm['image'] != null && movieForm['image'].toString().isNotEmpty)
          ? movieForm['imageBase64'] 
          : null,
      createdBy: auth.currentUser?.uid ?? '', // Substitua pelo ID do usuário autenticado
    );
    await _repository.saveMovie(newMovie);
    
    await loadMovies();
  } catch (e) {
    print('Erro: Falha ao salvar filme: $e');
    rethrow;
  }
}

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
