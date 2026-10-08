import 'package:court_click/core/constants/api_key.dart';
import 'package:dio/dio.dart';

class ComingSoonRemoteDataSource {
  final Dio dio;

  ComingSoonRemoteDataSource(this.dio);

  Future<Response> getUpcomingMovies() async {
    return await dio.get(
      ApiConstants.upcoming,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
        'page': 1,
      },
    );
  }
}