abstract class HomeEvent {}

class NowPlayingGetEvent extends HomeEvent {}

class PopularGetEvent extends HomeEvent {}

class TrendingGetEvent extends HomeEvent {}

class Top10GetEvent extends HomeEvent {}

class UpcomingGetEvent extends HomeEvent {}

class TopRatedGetEvent extends HomeEvent {}

class MyListGetEvent extends HomeEvent {}

class AfricanMoviesGetEvent extends HomeEvent {}

class HollywoodGetEvent extends HomeEvent {}

class NetflixOriginalsGetEvent extends HomeEvent {}

class WatchAgainGetEvent extends HomeEvent {}

class NewReleasesGetEvent extends HomeEvent {}

class TvThrillersGetEvent extends HomeEvent {}

class UsTvShowsGetEvent extends HomeEvent {}

class CharactersGetEvent extends HomeEvent {
  final int movieId;

  CharactersGetEvent(this.movieId);
}