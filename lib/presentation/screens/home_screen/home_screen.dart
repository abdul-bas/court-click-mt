import 'package:court_click/presentation/controllers/home_controllers.dart';
import 'package:court_click/presentation/screens/bloc/home_bloc.dart';
import 'package:court_click/presentation/screens/bloc/home_events.dart';
import 'package:court_click/presentation/screens/bloc/home_states.dart';
import 'package:court_click/core/utils/home_state_handler.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/bottom_bavigation.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/continue_watching_row.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/hero_carousel.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/home_label.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/movie_row.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/previews_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = HomeController();
  @override
  void initState() {
    super.initState();

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, child) {
          return BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              homeStateHandler(state, context);
              _controller.onState(state);
            },
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                HeroCarousel(movies: _controller.nowPlayingMovies),
                const HomeLabelWidget('Previews'),
                PreviewsRow(movies: _controller.nowPlayingMovies),
                const HomeLabelWidget('Continue Watching for Onyeka'),
                ContinueWatchingRow(
                  movies: _controller.nowPlayingMovies.reversed.toList(),
                ),
                MovieRow(
                  title: 'Popular on Netflix',
                  movies: _controller.popularMovies,
                ),
                MovieRow(
                  title: 'Trending Now',
                  movies: _controller.trendingMovies,
                ),
                MovieRow(
                  title: 'Top 10 in Nigeria Today',
                  movies: _controller.top10Movies,
                  ranked: true,
                ),
                MovieRow(title: 'My List', movies: _controller.myListMovies),
                MovieRow(
                  title: 'African Movies',
                  movies: _controller.africanMovies,
                ),
                MovieRow(
                  title: 'Hollywood Movies & TV',
                  movies: _controller.hollywoodMovies,
                ),
                MovieRow(
                  title: 'Netflix Originals',
                  movies: _controller.netflixOriginals,
                ),
                MovieRow(
                  title: 'Watch It Again',
                  movies: _controller.watchAgainMovies,
                ),
                MovieRow(
                  title: 'New Releases',
                  movies: _controller.newReleaseMovies,
                ),
                MovieRow(
                  title: 'TV Thrillers & Mysteries',
                  movies: _controller.tvThrillers,
                ),
                MovieRow(title: 'US TV Shows', movies: _controller.usTvShows),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const HomeBottomNav(),
    );
  }
}
