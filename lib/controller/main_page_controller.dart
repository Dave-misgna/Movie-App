import 'package:flutter_movie_app/model/main_page_data.dart';
import 'package:flutter_movie_app/model/movie_model.dart';
import 'package:flutter_movie_app/services/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../model/search_category.dart';

class MainPageController extends StateNotifier<MainPageData> {
  MainPageController([MainPageData? state])
    : super(state ?? MainPageData.initial()) {
    getMovies();
  }

  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<MovieModel> movies = [];
      if (state.searchText.isEmpty) {
        if (state.searchCategory == SearchCategory.popular) {
          movies = await _movieService.getPopularMovies(state.page);
        } else if (state.searchCategory == SearchCategory.upcomming) {
          movies = await _movieService.getUpcomingMovies(state.page);
        } else if (state.searchCategory == SearchCategory.none) {
          movies = [];
        } else {
          movies = await _movieService.getSearchMovies(
            state.searchText,
          );
        }
      }

      state = state.copyWith(
        movies: [...state.movies, ...movies],
        page: state.page + 1,
      );
    } catch (e) {
      print('Error fetching movies: $e');
    }
  }

  void updateSearchCategory(String? category) {
    try {
      state = state.copyWith(
        movies: [],
        page: 1,
        searchCategory: category,
        searchText: '',
      );
      getMovies();
    } catch (e) {
      print(e);
    }
  }

  void updateSearchmovie(String searchtext) {
    try {
      state = state.copyWith(
        movies: [],
        page: 1,
        searchCategory: SearchCategory.none,
        searchText: searchtext,
      );
      getMovies();
    } catch (e) {
      print(e);
    }
  }
}
