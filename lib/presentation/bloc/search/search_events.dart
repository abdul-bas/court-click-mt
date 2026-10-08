abstract class SearchEvent {}

class TopSearchesGetEvent extends SearchEvent {}

class SearchQueryChanged extends SearchEvent {
  final String query;

  SearchQueryChanged(this.query);
}