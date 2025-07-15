import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/movie_model.dart';

class MovieTile extends StatelessWidget {
  final double height;
  final double width;
  final MovieModel movie;
  const MovieTile({
    super.key,
    required this.movie,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [moviePosterWidget(movie.posterURL())],
    );
  }

  Widget moviePosterWidget(String imageUrl) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imageUrl))
      ),
    );
  }
}
