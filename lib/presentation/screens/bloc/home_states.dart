import 'package:court_click/data/model/charecter_model.dart';
import 'package:court_click/data/model/movie_model.dart';
abstract class HomeState {}


class NowPlayingLoading extends HomeState {}

class NowPlayingLoaded extends HomeState {
  final List<MovieModel> movies;
  NowPlayingLoaded(this.movies);
}

class NowPlayingError extends HomeState {
  final String message;
  NowPlayingError(this.message);
}


class CharactersLoading extends HomeState {}

class CharactersLoaded extends HomeState {
  final List<CharacterModel> characters;
  CharactersLoaded(this.characters);
}

class CharactersError extends HomeState {
  final String message;
  CharactersError(this.message);
}


class PopularLoading extends HomeState {}

class PopularLoaded extends HomeState {
  final List<MovieModel> movies;
  PopularLoaded(this.movies);
}

class PopularError extends HomeState {
  final String message;
  PopularError(this.message);
}


class TrendingLoading extends HomeState {}

class TrendingLoaded extends HomeState {
  final List<MovieModel> movies;
  TrendingLoaded(this.movies);
}

class TrendingError extends HomeState {
  final String message;
  TrendingError(this.message);
}


class Top10Loading extends HomeState {}

class Top10Loaded extends HomeState {
  final List<MovieModel> movies;
  Top10Loaded(this.movies);
}

class Top10Error extends HomeState {
  final String message;
  Top10Error(this.message);
}


class UpcomingLoading extends HomeState {}

class UpcomingLoaded extends HomeState {
  final List<MovieModel> movies;
  UpcomingLoaded(this.movies);
}

class UpcomingError extends HomeState {
  final String message;
  UpcomingError(this.message);
}


class TopRatedLoading extends HomeState {}

class TopRatedLoaded extends HomeState {
  final List<MovieModel> movies;
  TopRatedLoaded(this.movies);
}

class TopRatedError extends HomeState {
  final String message;
  TopRatedError(this.message);
}


class MyListLoading extends HomeState {}

class MyListLoaded extends HomeState {
  final List<MovieModel> movies;
  MyListLoaded(this.movies);
}

class MyListError extends HomeState {
  final String message;
  MyListError(this.message);
}


class AfricanMoviesLoading extends HomeState {}

class AfricanMoviesLoaded extends HomeState {
  final List<MovieModel> movies;
  AfricanMoviesLoaded(this.movies);
}

class AfricanMoviesError extends HomeState {
  final String message;
  AfricanMoviesError(this.message);
}


class HollywoodLoading extends HomeState {}

class HollywoodLoaded extends HomeState {
  final List<MovieModel> movies;
  HollywoodLoaded(this.movies);
}

class HollywoodError extends HomeState {
  final String message;
  HollywoodError(this.message);
}


class NetflixOriginalsLoading extends HomeState {}

class NetflixOriginalsLoaded extends HomeState {
  final List<MovieModel> movies;
  NetflixOriginalsLoaded(this.movies);
}

class NetflixOriginalsError extends HomeState {
  final String message;
  NetflixOriginalsError(this.message);
}


class WatchAgainLoading extends HomeState {}

class WatchAgainLoaded extends HomeState {
  final List<MovieModel> movies;
  WatchAgainLoaded(this.movies);
}

class WatchAgainError extends HomeState {
  final String message;
  WatchAgainError(this.message);
}


class NewReleasesLoading extends HomeState {}

class NewReleasesLoaded extends HomeState {
  final List<MovieModel> movies;
  NewReleasesLoaded(this.movies);
}

class NewReleasesError extends HomeState {
  final String message;
  NewReleasesError(this.message);
}


class TvThrillersLoading extends HomeState {}

class TvThrillersLoaded extends HomeState {
  final List<MovieModel> movies;
  TvThrillersLoaded(this.movies);
}

class TvThrillersError extends HomeState {
  final String message;
  TvThrillersError(this.message);
}


class UsTvShowsLoading extends HomeState {}

class UsTvShowsLoaded extends HomeState {
  final List<MovieModel> movies;
  UsTvShowsLoaded(this.movies);
}

class UsTvShowsError extends HomeState {
  final String message;
  UsTvShowsError(this.message);
}