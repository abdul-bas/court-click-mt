
import 'package:court_click/data/repositories/search_repository.dart';
import 'package:court_click/presentation/bloc/search/search_events.dart';
import 'package:court_click/presentation/bloc/search/search_initial_state.dart';
import 'package:court_click/presentation/bloc/search/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;

  SearchBloc({required this.repository}) : super(SearchInitial()) {
    on<TopSearchesGetEvent>(getTopSearches);

  
    on<SearchQueryChanged>(searchMovies);
  }

  Future<void> getTopSearches(
    TopSearchesGetEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(TopSearchesLoading());
    emit(await repository.getTopSearches());
  }

  Future<void> searchMovies(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
// Deboucer userd for avoid the mutiple function call back
    await Future.delayed(const Duration(milliseconds: 400)); 

    emit(SearchLoading());
    emit(await repository.searchMulti(query));
  }
}