import 'package:court_click/data/model/movie_model.dart';

abstract class SearchState {}



class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final String query;
  final List<MovieModel> movies;

  SearchLoaded(this.query, this.movies);
}

class SearchEmpty extends SearchState {
  final String query;

  SearchEmpty(this.query);
}

class SearchError extends SearchState {
  final String query;
  final String message;

  SearchError(this.query, this.message);
}


class TopSearchesLoading extends SearchState {}

class TopSearchesLoaded extends SearchState {
  final List<MovieModel> movies;

  TopSearchesLoaded(this.movies);
}

class TopSearchesError extends SearchState {
  final String message;

  TopSearchesError(this.message);
}