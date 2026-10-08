import 'package:court_click/data/data_sources/commin_soon_data_sorces.dart';
import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/bloc/coming_soon/comming_soon_state.dart';
import 'package:dio/dio.dart';

class ComingSoonRepository {
  final ComingSoonRemoteDataSource remoteDataSource;

  ComingSoonRepository(this.remoteDataSource);

  List<MovieModel> _parseMovies(Response response) {
    final results = (response.data['results'] as List?) ?? [];
    final movies = <MovieModel>[];

    for (final item in results) {
      try {
        movies.add(MovieModel.fromJson(item as Map<String, dynamic>));
      } catch (_) {}
    }

    movies.sort(
      (a, b) => (a.releaseDate ?? '9999').compareTo(b.releaseDate ?? '9999'),
    );
    return movies;
  }

  Future<ComingSoonState> getUpcomingMovies() async {
    try {
      print(
          '..............................................................',
        );
      final response = await remoteDataSource.getUpcomingMovies();

      if (response.statusCode == 200) {
        final movies = _parseMovies(response);
        if (movies.isEmpty) return ComingSoonEmpty();
         print(
          '..............................................................${response.statusCode}',
        );
        return ComingSoonLoaded(movies);
      } else {
       
      }
      return ComingSoonError(
        'Failed to load coming soon: ${response.statusCode}',
      );
    } on DioException catch (e) {
      return ComingSoonError(e.message ?? 'Network error');
    } catch (e) {
      return ComingSoonError(e.toString());
    }
  }
}
