import 'package:biblioteca_flutter/app/modules/movies/model/movies_model.dart';
import 'package:biblioteca_flutter/app/modules/movies/provider/movie_provider.dart';

class MovieRepository {
  final MovieProvider _provider = MovieProvider();

  Future<void> saveMovie(Movie movie) async {
    await _provider.addMovie(movie);
  }

  Future<List<Movie>> fetchMovies() async {
    return await _provider.getAllMovies();
  }
}