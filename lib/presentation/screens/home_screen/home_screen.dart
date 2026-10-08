import 'package:court_click/presentation/controllers/home_controllers.dart';
import 'package:court_click/presentation/bloc/home/home_bloc.dart';
import 'package:court_click/presentation/bloc/home/home_states.dart';
import 'package:court_click/core/utils/home_state_handler.dart';
import 'package:court_click/presentation/controllers/navigation_controller.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/bottom_bavigation.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/continue_watching_row.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/hero_carousel.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/home_label.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/movie_row.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/previews_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.navigationController,
    required this.homeController,
  });

  final NavigationController navigationController;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListenableBuilder(
        listenable: homeController,
        builder: (context, child) {
          final c = homeController;
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              HeroCarousel(movies: c.nowPlayingMovies),
              const HomeLabelWidget('Previews'),
              PreviewsRow(movies: c.nowPlayingMovies),
              const HomeLabelWidget('Continue Watching for Onyeka'),
              ContinueWatchingRow(movies: c.nowPlayingMovies.reversed.toList()),
              MovieRow(title: 'Popular on Netflix', movies: c.popularMovies),
              MovieRow(title: 'Trending Now', movies: c.trendingMovies),
              MovieRow(
                title: 'Top 10 in Nigeria Today',
                movies: c.top10Movies,
                ranked: true,
              ),
              MovieRow(title: 'My List', movies: c.myListMovies),
              MovieRow(title: 'African Movies', movies: c.africanMovies),
              MovieRow(title: 'Hollywood Movies & TV', movies: c.hollywoodMovies),
              MovieRow(title: 'Netflix Originals', movies: c.netflixOriginals),
              MovieRow(title: 'Watch It Again', movies: c.watchAgainMovies),
              MovieRow(title: 'New Releases', movies: c.newReleaseMovies),
              MovieRow(title: 'TV Thrillers & Mysteries', movies: c.tvThrillers),
              MovieRow(title: 'US TV Shows', movies: c.usTvShows),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
      bottomNavigationBar: HomeBottomNav(controller: navigationController),
    );
  }
}