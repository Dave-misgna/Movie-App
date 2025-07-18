import 'package:dio/dio.dart';
import 'package:flutter_movie_app/model/movie_model.dart';
import 'package:flutter_movie_app/services/http_service.dart';
import 'package:get_it/get_it.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  late HTTPService _http;

  MovieService() {
    _http = getIt.get<HTTPService>();
  }

  Future<List<MovieModel>> getPopularMovies(int? page) async {
    Response response = await _http.get('/movies/popular', {'page': page});

    if (response.statusCode == 200) {
      List<MovieModel> movies = ( response.data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}
