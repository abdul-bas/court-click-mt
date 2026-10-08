import 'package:court_click/core/constants/bottom_navigation_bar_items.dart';
import 'package:court_click/core/utils/home_state_handler.dart';
import 'package:court_click/presentation/bloc/home/home_bloc.dart';
import 'package:court_click/presentation/bloc/home/home_events.dart';
import 'package:court_click/presentation/bloc/home/home_states.dart';
import 'package:court_click/presentation/bloc/search/search_bloc.dart';
import 'package:court_click/presentation/bloc/search/search_events.dart';
import 'package:court_click/presentation/bloc/search/search_state.dart';
import 'package:court_click/presentation/controllers/home_controllers.dart';

import 'package:court_click/presentation/controllers/navigation_controller.dart';
import 'package:court_click/presentation/controllers/search_controller.dart';
import 'package:court_click/presentation/screens/home_screen/home_screen.dart';
import 'package:court_click/presentation/screens/search_screen/search_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final NavigationController _navController = NavigationController();
  final HomeController _homeController = HomeController();
  final SearchHandler _searchHandler = SearchHandler();

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      HomeScreen(
        navigationController: _navController,
        homeController: _homeController,
      ),
      SearchScreen(
        navigationController: _navController,
        searchHandler: _searchHandler,
      ),
   
      for (var i = 2; i < navigationItems.length; i++)
        navigationItems[i]['navigation'](_navController) as Widget,
    ];

    context.read<HomeBloc>()
      ..add(NowPlayingGetEvent())
      ..add(PopularGetEvent())
      ..add(TrendingGetEvent())
      ..add(Top10GetEvent())
      ..add(MyListGetEvent())
      ..add(AfricanMoviesGetEvent())
      ..add(HollywoodGetEvent())
      ..add(NetflixOriginalsGetEvent())
      ..add(WatchAgainGetEvent())
      ..add(NewReleasesGetEvent())
      ..add(TvThrillersGetEvent())
      ..add(UsTvShowsGetEvent());

    context.read<SearchBloc>().add(TopSearchesGetEvent());
  }

  @override
  void dispose() {
    _navController.dispose();
    _homeController.dispose();
    _searchHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            homeStateHandler(state, context);
            _homeController.onState(state);
          },
        ),
        BlocListener<SearchBloc, SearchState>(
          listener: (context, state) => _searchHandler.onState(state),
        ),
      ],
      child: ListenableBuilder(
        listenable: _navController,
        builder: (context, child) => IndexedStack(
          index: _navController.currentIndex,
          children: _pages,
        ),
      ),
    );
  }
}