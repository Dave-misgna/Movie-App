import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/movie_model.dart';
import 'package:flutter_movie_app/widget/movie_tile.dart';

class MoviesList extends StatelessWidget {
  final double height;
  final double width;
  const MoviesList({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    final List<MovieModel> movies = [];

    for (var i = 0; i < 3; i++) {
      movies.add(
        MovieModel(
          name: 'Thor',
          language: 'EN',
          isAdult: false,
          description: "A Super hero movie",
          posterPath: "/AEgggzRr1vZCLY86MAp93li43z.jpg",
          backdropPath: "/nKyBbFSooRPTJVqjrDteD1lF733.jpg",
          rating: 9.1,
          releaseDate: '2025-06-03',
        ),
      );
    }

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
