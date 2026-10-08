import 'package:court_click/data/data_sources/movie_remote_data_source.dart';
import 'package:court_click/data/model/charecter_model.dart';
import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/bloc/home/home_states.dart';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final MovieRemoteDataSource remoteDataSource;

  HomeRepository(this.remoteDataSource);

  List<MovieModel> _parseMovies(Response response) {
    return (response.data['results'] as List)
        .map((movie) => MovieModel.fromJson(movie))
        .toList();
  }

  Future<HomeState> getNowPlayingMovies() async {
    try {
      final response = await remoteDataSource.getNowPlayingMovies();
      if (response.statusCode == 200) {
        return NowPlayingLoaded(_parseMovies(response));
      }
      return NowPlayingError('Failed to load movies: ${response.statusCode}');
    } on DioException catch (e) {
      return NowPlayingError(e.message ?? 'Network error');
    } catch (e) {
      return NowPlayingError(e.toString());
    }
  }

  Future<HomeState> getPopularMovies() async {
    try {
      final response = await remoteDataSource.getPopularMovies();
      if (response.statusCode == 200) {
        return PopularLoaded(_parseMovies(response));
      }
      return PopularError('Failed to load popular: ${response.statusCode}');
    } on DioException catch (e) {
      return PopularError(e.message ?? 'Network error');
    } catch (e) {
      return PopularError(e.toString());
    }
  }

  Future<HomeState> getTrendingMovies() async {
    try {
      final response = await remoteDataSource.getTrending();
      if (response.statusCode == 200) {
        return TrendingLoaded(_parseMovies(response));
      }
      return TrendingError('Failed to load trending: ${response.statusCode}');
    } on DioException catch (e) {
      return TrendingError(e.message ?? 'Network error');
    } catch (e) {
      return TrendingError(e.toString());
    }
  }

  Future<HomeState> getTop10Movies() async {
    try {
      final response = await remoteDataSource.getTop10Nigeria();
      if (response.statusCode == 200) {
        return Top10Loaded(_parseMovies(response));
      }
      return Top10Error('Failed to load top 10: ${response.statusCode}');
    } on DioException catch (e) {
      return Top10Error(e.message ?? 'Network error');
    } catch (e) {
      return Top10Error(e.toString());
    }
  }

  Future<HomeState> getUpcomingMovies() async {
    try {
      final response = await remoteDataSource.getUpcomingMovies();
      if (response.statusCode == 200) {
        return UpcomingLoaded(_parseMovies(response));
      }
      return UpcomingError('Failed to load upcoming: ${response.statusCode}');
    } on DioException catch (e) {
      return UpcomingError(e.message ?? 'Network error');
    } catch (e) {
      return UpcomingError(e.toString());
    }
  }

  Future<HomeState> getTopRatedMovies() async {
    try {
      final response = await remoteDataSource.getTopRatedMovies();
      if (response.statusCode == 200) {
        return TopRatedLoaded(_parseMovies(response));
      }
      return TopRatedError('Failed to load top rated: ${response.statusCode}');
    } on DioException catch (e) {
      return TopRatedError(e.message ?? 'Network error');
    } catch (e) {
      return TopRatedError(e.toString());
    }
  }

  // Placeholder: top rated until a real "My List" store exists
  Future<HomeState> getMyListMovies() async {
    try {
      final response = await remoteDataSource.getTopRatedMovies();
      if (response.statusCode == 200) {
        return MyListLoaded(_parseMovies(response));
      }
      return MyListError('Failed to load my list: ${response.statusCode}');
    } on DioException catch (e) {
      return MyListError(e.message ?? 'Network error');
    } catch (e) {
      return MyListError(e.toString());
    }
  }

  Future<HomeState> getAfricanMovies() async {
    try {
      final response = await remoteDataSource.getAfricanMovies();
      if (response.statusCode == 200) {
        return AfricanMoviesLoaded(_parseMovies(response));
      }
      return AfricanMoviesError('Failed to load african: ${response.statusCode}');
    } on DioException catch (e) {
      return AfricanMoviesError(e.message ?? 'Network error');
    } catch (e) {
      return AfricanMoviesError(e.toString());
    }
  }

  Future<HomeState> getHollywoodMovies() async {
    try {
      final response = await remoteDataSource.getHollywoodMovies();
      if (response.statusCode == 200) {
        return HollywoodLoaded(_parseMovies(response));
      }
      return HollywoodError('Failed to load hollywood: ${response.statusCode}');
    } on DioException catch (e) {
      return HollywoodError(e.message ?? 'Network error');
    } catch (e) {
      return HollywoodError(e.toString());
    }
  }

  Future<HomeState> getNetflixOriginals() async {
    try {
      final response = await remoteDataSource.getNetflixOriginals();
      if (response.statusCode == 200) {
        return NetflixOriginalsLoaded(_parseMovies(response));
      }
      return NetflixOriginalsError(
          'Failed to load originals: ${response.statusCode}');
    } on DioException catch (e) {
      return NetflixOriginalsError(e.message ?? 'Network error');
    } catch (e) {
      return NetflixOriginalsError(e.toString());
    }
  }

  // Placeholder: top rated TV until real watch history exists
  Future<HomeState> getWatchAgain() async {
    try {
      final response = await remoteDataSource.getTopRatedTv();
      if (response.statusCode == 200) {
        return WatchAgainLoaded(_parseMovies(response));
      }
      return WatchAgainError('Failed to load watch again: ${response.statusCode}');
    } on DioException catch (e) {
      return WatchAgainError(e.message ?? 'Network error');
    } catch (e) {
      return WatchAgainError(e.toString());
    }
  }

  Future<HomeState> getNewReleases() async {
    try {
      final response = await remoteDataSource.getUpcomingMovies();
      if (response.statusCode == 200) {
        return NewReleasesLoaded(_parseMovies(response));
      }
      return NewReleasesError('Failed to load releases: ${response.statusCode}');
    } on DioException catch (e) {
      return NewReleasesError(e.message ?? 'Network error');
    } catch (e) {
      return NewReleasesError(e.toString());
    }
  }

  Future<HomeState> getTvThrillers() async {
    try {
      final response = await remoteDataSource.getTvThrillers();
      if (response.statusCode == 200) {
        return TvThrillersLoaded(_parseMovies(response));
      }
      return TvThrillersError('Failed to load thrillers: ${response.statusCode}');
    } on DioException catch (e) {
      return TvThrillersError(e.message ?? 'Network error');
    } catch (e) {
      return TvThrillersError(e.toString());
    }
  }

  Future<HomeState> getUsTvShows() async {
    try {
      final response = await remoteDataSource.getUsTvShows();
      if (response.statusCode == 200) {
        return UsTvShowsLoaded(_parseMovies(response));
      }
      return UsTvShowsError('Failed to load US TV: ${response.statusCode}');
    } on DioException catch (e) {
      return UsTvShowsError(e.message ?? 'Network error');
    } catch (e) {
      return UsTvShowsError(e.toString());
    }
  }

  Future<HomeState> getCharacters(int movieId) async {
    try {
      final response = await remoteDataSource.fetchCharacters(movieId);
      if (response.statusCode == 200) {
        final List<CharacterModel> characters = (response.data['cast'] as List)
            .map((character) => CharacterModel.fromJson(character))
            .toList();
        return CharactersLoaded(characters);
      }
      return CharactersError('Failed to load characters: ${response.statusCode}');
    } on DioException catch (e) {
      return CharactersError(e.message ?? 'Network error');
    } catch (e) {
      return CharactersError(e.toString());
    }
  }
}