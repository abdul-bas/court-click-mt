import 'package:court_click/core/constants/api_key.dart';
import 'package:dio/dio.dart';

class SearchRemoteDataSource {
  final Dio dio;

  SearchRemoteDataSource(this.dio);

  Future<Response> searchMulti(String query) async {
    return await dio.get(
      ApiConstants.searchMulti,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
        'query': query,
        'include_adult': false,
        'page': 1,
      },
    );
  }

  Future<Response> getTopSearches() async {
    return await dio.get(
      ApiConstants.trending,
      queryParameters: {'api_key': ApiConstants.apiKey},
    );
  }
}