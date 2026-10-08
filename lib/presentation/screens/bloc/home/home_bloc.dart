import 'package:bloc/bloc.dart';
import 'package:court_click/data/repositories/home_repository.dart';
import 'package:court_click/presentation/screens/bloc/home/home_events.dart';
import 'package:court_click/presentation/screens/bloc/home/home_initial_state.dart';
import 'package:court_click/presentation/screens/bloc/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({required this.repository}) : super(HomeInitial()) {
    on<NowPlayingGetEvent>(getNowPlayingMovies);
    on<PopularGetEvent>(getPopularMovies);
    on<TrendingGetEvent>(getTrendingMovies);
    on<Top10GetEvent>(getTop10Movies);
    on<UpcomingGetEvent>(getUpcomingMovies);
    on<TopRatedGetEvent>(getTopRatedMovies);
    on<MyListGetEvent>(getMyListMovies);
    on<AfricanMoviesGetEvent>(getAfricanMovies);
    on<HollywoodGetEvent>(getHollywoodMovies);
    on<NetflixOriginalsGetEvent>(getNetflixOriginals);
    on<WatchAgainGetEvent>(getWatchAgain);
    on<NewReleasesGetEvent>(getNewReleases);
    on<TvThrillersGetEvent>(getTvThrillers);
    on<UsTvShowsGetEvent>(getUsTvShows);
    on<CharactersGetEvent>(getCharacters);
  }

  Future<void> getNowPlayingMovies(
      NowPlayingGetEvent event, Emitter<HomeState> emit) async {
    emit(NowPlayingLoading());
    emit(await repository.getNowPlayingMovies());
  }

  Future<void> getPopularMovies(
      PopularGetEvent event, Emitter<HomeState> emit) async {
    emit(PopularLoading());
    emit(await repository.getPopularMovies());
  }

  Future<void> getTrendingMovies(
      TrendingGetEvent event, Emitter<HomeState> emit) async {
    emit(TrendingLoading());
    emit(await repository.getTrendingMovies());
  }

  Future<void> getTop10Movies(
      Top10GetEvent event, Emitter<HomeState> emit) async {
    emit(Top10Loading());
    emit(await repository.getTop10Movies());
  }

  Future<void> getUpcomingMovies(
      UpcomingGetEvent event, Emitter<HomeState> emit) async {
    emit(UpcomingLoading());
    emit(await repository.getUpcomingMovies());
  }

  Future<void> getTopRatedMovies(
      TopRatedGetEvent event, Emitter<HomeState> emit) async {
    emit(TopRatedLoading());
    emit(await repository.getTopRatedMovies());
  }

  Future<void> getMyListMovies(
      MyListGetEvent event, Emitter<HomeState> emit) async {
    emit(MyListLoading());
    emit(await repository.getMyListMovies());
  }

  Future<void> getAfricanMovies(
      AfricanMoviesGetEvent event, Emitter<HomeState> emit) async {
    emit(AfricanMoviesLoading());
    emit(await repository.getAfricanMovies());
  }

  Future<void> getHollywoodMovies(
      HollywoodGetEvent event, Emitter<HomeState> emit) async {
    emit(HollywoodLoading());
    emit(await repository.getHollywoodMovies());
  }

  Future<void> getNetflixOriginals(
      NetflixOriginalsGetEvent event, Emitter<HomeState> emit) async {
    emit(NetflixOriginalsLoading());
    emit(await repository.getNetflixOriginals());
  }

  Future<void> getWatchAgain(
      WatchAgainGetEvent event, Emitter<HomeState> emit) async {
    emit(WatchAgainLoading());
    emit(await repository.getWatchAgain());
  }

  Future<void> getNewReleases(
      NewReleasesGetEvent event, Emitter<HomeState> emit) async {
    emit(NewReleasesLoading());
    emit(await repository.getNewReleases());
  }

  Future<void> getTvThrillers(
      TvThrillersGetEvent event, Emitter<HomeState> emit) async {
    emit(TvThrillersLoading());
    emit(await repository.getTvThrillers());
  }

  Future<void> getUsTvShows(
      UsTvShowsGetEvent event, Emitter<HomeState> emit) async {
    emit(UsTvShowsLoading());
    emit(await repository.getUsTvShows());
  }

  Future<void> getCharacters(
      CharactersGetEvent event, Emitter<HomeState> emit) async {
    emit(CharactersLoading());
    emit(await repository.getCharacters(event.movieId));
  }
}