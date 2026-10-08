import 'package:court_click/data/data_sources/search_data_source.dart';
import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/bloc/search/search_state.dart';
import 'package:dio/dio.dart';

class SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepository(this.remoteDataSource);

 
  List<MovieModel> _parseResults(Response response) {
    final results = (response.data['results'] as List?) ?? [];
    final movies = <MovieModel>[];

    for (final item in results) {
      try {
        final map = item as Map<String, dynamic>;
        if (map['media_type'] == 'person') continue;
        movies.add(MovieModel.fromJson(map));
      } catch (_) {}
    }
    return movies;
  }

  Future<SearchState> searchMulti(String query) async {
    try {
      final response = await remoteDataSource.searchMulti(query);

      if (response.statusCode == 200) {
        final movies = _parseResults(response);
        if (movies.isEmpty) return SearchEmpty(query);
        return SearchLoaded(query, movies);
      }
      return SearchError(
        query,
        'Failed to search: ${response.statusCode}',
      );
    } on DioException catch (e) {
      return SearchError(query, e.message ?? 'Network error');
    } catch (e) {
      return SearchError(query, e.toString());
    }
  }

  Future<SearchState> getTopSearches() async {
    try {
      final response = await remoteDataSource.getTopSearches();

      if (response.statusCode == 200) {
        return TopSearchesLoaded(_parseResults(response).take(10).toList());
      }
      return TopSearchesError(
        'Failed to load top searches: ${response.statusCode}',
      );
    } on DioException catch (e) {
      return TopSearchesError(e.message ?? 'Network error');
    } catch (e) {
      return TopSearchesError(e.toString());
    }
  }
}