import 'package:flutter_movie_app/model/main_page_data.dart';
import 'package:flutter_movie_app/model/movie_model.dart';
import 'package:flutter_movie_app/services/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class MainPageController extends StateNotifier<MainPageData> {
  MainPageController([MainPageData? state])
    : super(state ?? MainPageData.initial()) {
    getMovies();
  }

  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<MovieModel> movies = [];
      movies = await _movieService.getPopularMovies(state.page);
    } catch (e) {}
  }
}
