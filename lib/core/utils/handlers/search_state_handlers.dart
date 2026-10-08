import 'package:court_click/presentation/bloc/search/search_bloc.dart';
import 'package:court_click/presentation/bloc/search/search_events.dart';
import 'package:court_click/presentation/bloc/search/search_state.dart';
import 'package:court_click/presentation/controllers/search_controller.dart';

import 'package:court_click/presentation/screens/search_screen/widgets/resulte_tile.dart';
import 'package:court_click/presentation/screens/search_screen/widgets/search_loading_view.dart';
import 'package:court_click/presentation/screens/search_screen/widgets/search_message_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Widget searchStateHandler(
  SearchState state,
  BuildContext context, {
  required SearchHandler handler,
  required String query,
}) {
  
  if (query.isEmpty) {
    if (handler.topLoading) {
      return const SearchLoadingView();
    }

    if (handler.topError != null) {
      return SearchMessageView(
        icon: Icons.wifi_off,
        title: 'Something went wrong',
        subtitle: handler.topError!,
        onRetry: () => context.read<SearchBloc>().add(TopSearchesGetEvent()),
      );
    }

    if (handler.topSearches.isEmpty) {
      return const SearchMessageView(
        icon: Icons.search,
        title: 'Nothing to show yet',
        subtitle: 'Search for a show, movie or genre.',
      );
    }

    return ResulteTile(
      movies: handler.topSearches,
      title: 'Top Searches',
      topBadge: true,
    );
  }

  
  if (state is SearchLoaded && state.query == query) {
    return ResulteTile(
      movies: state.movies,
      title: 'Movies & TV',
      topBadge: false,
    );
  }

  if (state is SearchEmpty && state.query == query) {
    return SearchMessageView(
      icon: Icons.search_off,
      title: 'No results for "$query"',
      subtitle: 'Try a different title, actor or genre.',
    );
  }

  if (state is SearchError && state.query == query) {
    return SearchMessageView(
      icon: Icons.error_outline,
      title: 'Something went wrong',
      subtitle: state.message,
      onRetry: () {
        context.read<SearchBloc>().add(SearchQueryChanged(state.query));
      },
    );
  }

  
  return const SearchLoadingView();
}