import 'package:court_click/data/model/movie_model.dart';

abstract class ComingSoonState {}



class ComingSoonLoading extends ComingSoonState {}

class ComingSoonLoaded extends ComingSoonState {
  final List<MovieModel> movies;
  ComingSoonLoaded(this.movies);
}

class ComingSoonEmpty extends ComingSoonState {}

class ComingSoonError extends ComingSoonState {
  final String message;
  ComingSoonError(this.message);
}