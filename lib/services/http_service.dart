import 'package:dio/dio.dart';
import 'package:flutter_movie_app/model/app_config.dart';
import 'package:get_it/get_it.dart';

class HTTPService {
  final Dio dio = Dio();
  final GetIt getit = GetIt.instance;

  late String _baseUrl;
  late String _apiKey;

  HTTPService() {
    AppConfig config = getit.get<AppConfig>();
    _baseUrl = config.BASE_API_URL;
    _apiKey = config.API_KEY;
  }

  Future<Response> get(String path, Map<String, dynamic>? query) async {
    try {
      String uri = '$_baseUrl$path';
      Map<String, dynamic> query0 = {'api_key': _apiKey, 'language': 'en-us'};
      if (query != null) {
        query0.addAll(query);
      }
      return await dio.get(uri, queryParameters: query0);
    } on DioException catch (e) {
      return e.response ??
          Response(
            requestOptions: e.requestOptions,
            statusCode: 500,
            data: {"message": "No response received"},
          );
    }
  }
}
