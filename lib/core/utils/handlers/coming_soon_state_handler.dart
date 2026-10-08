import 'package:court_click/presentation/bloc/coming_soon/coming_soon_event.dart';
import 'package:court_click/presentation/bloc/coming_soon/comming_soon_bloc.dart';
import 'package:court_click/presentation/bloc/coming_soon/comming_soon_state.dart';
import 'package:court_click/presentation/controllers/comming_soon_controller.dart';
import 'package:court_click/presentation/screens/coming_soon_screen/widgets/comin_soon_list.dart';
import 'package:court_click/presentation/screens/search_screen/widgets/search_loading_view.dart';
import 'package:court_click/presentation/screens/search_screen/widgets/search_message_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget comingSoonStateHandler(
  ComingSoonState state,
  ComingSoonController controller,
  BuildContext context,
) {
  if (state is ComingSoonLoaded) {
    return ComingSoonList(movies: state.movies, controller: controller);
  }

  if (state is ComingSoonEmpty) {
    return const SearchMessageView(
      icon: Icons.movie_outlined,
      title: 'Nothing coming soon',
      subtitle: 'Check back later for new releases.',
    );
  }

  if (state is ComingSoonError) {
    return SearchMessageView(
      icon: Icons.error_outline,
      title: 'Something went wrong',
      subtitle: state.message,
      onRetry: () => context.read<ComingSoonBloc>().add(ComingSoonGetEvent()),
    );
  }

  return const SearchLoadingView(); 
}