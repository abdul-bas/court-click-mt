import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/controllers/comming_soon_controller.dart';
import 'package:court_click/presentation/screens/coming_soon_screen/widgets/comin_soon_card.dart';
import 'package:court_click/presentation/screens/coming_soon_screen/widgets/new_arrival_title.dart';
import 'package:flutter/material.dart';

class ComingSoonList extends StatelessWidget {
  final List<MovieModel> movies;
  final ComingSoonController controller;

  const ComingSoonList({
    super.key,
    required this.movies,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final arrivals = movies.take(2).toList();

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            color: const Color(0xFF3A3A3A),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              children: [
                for (final movie in arrivals) NewArrivalTile(movie: movie),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),

        for (final movie in movies)
          ComingSoonCard(
            movie: movie,
            reminded: controller.isReminded(movie.id),
            onRemind: () => controller.toggleReminder(movie.id),
          ),
      ],
    );
  }
}
