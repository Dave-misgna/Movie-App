import 'package:flutter_movie_app/model/app_config.dart';
import 'package:get_it/get_it.dart';

class MovieModel {
  final String name;
  final String language;
  final bool isAdult;
  final String description;
  final String posterPath;
  final String backdropPath;
  final num rating;
  final String releaseDate;

  MovieModel({
    required this.name,
    required this.language,
    required this.isAdult,
    required this.description,
    required this.posterPath,
    required this.backdropPath,
    required this.rating,
    required this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
  return MovieModel(
    name: json['title'] ?? 'No Title',
    language: json['original_language'] ?? 'Unknown',
    isAdult: json['adult'] ?? false,
    description: json['overview'] ?? 'No description',
    posterPath: json['poster_path'] ?? '',
    backdropPath: json['backdrop_path'] ?? '',
    rating: (json['vote_average'] ?? 0).toDouble(),
    releaseDate: json['release_date'] ?? 'Unknown',
  );
}


  String posterURL() {
    final AppConfig appConfig = GetIt.instance.get<AppConfig>();
    return '${appConfig.BASE_IMAGE_API_URL}$posterPath';
  }
}
