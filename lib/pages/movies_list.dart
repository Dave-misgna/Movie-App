import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/movie_model.dart';
import 'package:flutter_movie_app/widget/movie_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/provider.dart';
import '../model/main_page_data.dart';

class MoviesList extends ConsumerWidget {
  final double height;
  final double width;
  const MoviesList({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    
    // Access the MainPageController and MainPageData using Riverpod
    
    MainPageData mainPageData = ref.watch(mainPageDataControllerProvider);
    
    final List<MovieModel> movies = mainPageData.movies;

    

    if (movies.isNotEmpty) {
      return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child: GestureDetector(
              onTap: () {},
              child: MovieTile(
                movie: movies[index],
                height: height * 0.20,
                width: width * 0.83,
              ),
            ),
          );
        },
      );
    } else {
      return Center(child: CircularProgressIndicator(color: Colors.white));
    }
  }
}
