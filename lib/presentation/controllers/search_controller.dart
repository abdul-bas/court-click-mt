import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/bloc/search/search_bloc.dart';
import 'package:court_click/presentation/bloc/search/search_events.dart';
import 'package:court_click/presentation/bloc/search/search_initial_state.dart';
import 'package:court_click/presentation/bloc/search/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SearchHandler extends ChangeNotifier {
  List<MovieModel> topSearches = [];

  bool topLoading = true;
  String? topError;

  SearchState searchState = SearchInitial();

  void onState(SearchState state) {
    if (state is TopSearchesLoading) {
      topLoading = true;
      topError = null;
    } else if (state is TopSearchesLoaded) {
      topLoading = false;
      topError = null;
      topSearches = state.movies;
    } else if (state is TopSearchesError) {
      topLoading = false;
      topError = state.message;
    } else {
      searchState = state;
    }

    notifyListeners();
  }

  void onChanged(
    String value,
    BuildContext context,
  ) {
    context.read<SearchBloc>().add(
          SearchQueryChanged(value),
        );
  }

  void clear(
    TextEditingController controller,
    BuildContext context,
  ) {
    controller.clear();

    context.read<SearchBloc>().add(
          SearchQueryChanged(''),
        );
  }

  @override
  void dispose() {
    super.dispose();
  }
}