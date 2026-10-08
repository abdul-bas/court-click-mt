import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/bloc/home/home_states.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List<MovieModel> nowPlayingMovies = [];
  List<MovieModel> popularMovies = [];
  List<MovieModel> trendingMovies = [];
  List<MovieModel> top10Movies = [];
  List<MovieModel> myListMovies = [];
  List<MovieModel> africanMovies = [];
  List<MovieModel> hollywoodMovies = [];
  List<MovieModel> netflixOriginals = [];
  List<MovieModel> watchAgainMovies = [];
  List<MovieModel> newReleaseMovies = [];
  List<MovieModel> tvThrillers = [];
  List<MovieModel> usTvShows = [];
  void onState(HomeState state) {
    if (state is NowPlayingLoaded) nowPlayingMovies = state.movies;
    if (state is PopularLoaded) popularMovies = state.movies;
    if (state is TrendingLoaded) trendingMovies = state.movies;
    if (state is Top10Loaded) top10Movies = state.movies;
    if (state is MyListLoaded) myListMovies = state.movies;
    if (state is AfricanMoviesLoaded) africanMovies = state.movies;
    if (state is HollywoodLoaded) hollywoodMovies = state.movies;
    if (state is NetflixOriginalsLoaded) netflixOriginals = state.movies;
    if (state is WatchAgainLoaded) watchAgainMovies = state.movies;
    if (state is NewReleasesLoaded) newReleaseMovies = state.movies;
    if (state is TvThrillersLoaded) tvThrillers = state.movies;
    if (state is UsTvShowsLoaded) usTvShows = state.movies;
    notifyListeners();
  }
}
