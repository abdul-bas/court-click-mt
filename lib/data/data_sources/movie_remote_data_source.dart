import 'package:court_click/core/constants/api_key.dart';
import 'package:dio/dio.dart';

class MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSource(this.dio);

  Future<Response> getNowPlayingMovies() async {
    return await dio.get(
      ApiConstants.nowPlaying,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
        'page': 1,
      },
    );
  }

  Future<Response> getPopularMovies() async {
    return await dio.get(
      ApiConstants.popular,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
        'page': 1,
      },
    );
  }

  Future<Response> fetchCharacters(int id) async {
    return await dio.get(
      '${ApiConstants.movieCredits}/$id/credits',
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
      },
    );
  }

  Future<Response> getTrending() async {
    return await dio.get(
      ApiConstants.trending,
      queryParameters: {'api_key': ApiConstants.apiKey},
    );
  }

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

  Future<Response> getTopRatedMovies() async {
    return await dio.get(
      ApiConstants.topRated,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
        'page': 1,
      },
    );
  }

  Future<Response> getPopularTv() async {
    return await dio.get(
      ApiConstants.popularTv,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
        'page': 1,
      },
    );
  }

  Future<Response> getTopRatedTv() async {
    return await dio.get(
      ApiConstants.topRatedTv,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
        'page': 1,
      },
    );
  }

  Future<Response> getAiringToday() async {
    return await dio.get(
      ApiConstants.airingToday,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
        'page': 1,
      },
    );
  }

  Future<Response> getOnTheAir() async {
    return await dio.get(
      ApiConstants.onTheAir,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
        'page': 1,
      },
    );
  }

  Future<Response> discoverMovies(Map<String, dynamic> params) async {
    return await dio.get(
      ApiConstants.discoverMovie,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
        'include_adult': false,
        'page': 1,
        ...params,
      },
    );
  }

  Future<Response> discoverTv(Map<String, dynamic> params) async {
    return await dio.get(
      ApiConstants.discoverTv,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'language': 'en-US',
        'include_adult': false,
        'page': 1,
        ...params,
      },
    );
  }

  

  Future<Response> getTop10Nigeria() async {
    return await discoverMovies({
      'region': 'NG',
      'sort_by': 'popularity.desc',
    });
  }

  Future<Response> getAfricanMovies() async {
    return await discoverMovies({
      'with_origin_country': 'NG|GH|ZA|KE',
      'sort_by': 'popularity.desc',
    });
  }

  Future<Response> getHollywoodMovies() async {
    return await discoverMovies({
      'with_origin_country': 'US',
      'sort_by': 'popularity.desc',
    });
  }

  Future<Response> getNetflixOriginals() async {
    return await discoverTv({
      'with_networks': '213', // Netflix
      'sort_by': 'popularity.desc',
    });
  }

  Future<Response> getTvThrillers() async {
    return await discoverTv({
      'with_genres': '9648|80',
      'sort_by': 'popularity.desc',
    });
  }

  Future<Response> getUsTvShows() async {
    return await discoverTv({
      'with_origin_country': 'US',
      'sort_by': 'popularity.desc',
    });
  }
}