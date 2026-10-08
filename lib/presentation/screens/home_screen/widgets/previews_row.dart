

import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/tmdb_image.dart';
import 'package:flutter/material.dart';

class PreviewsRow extends StatelessWidget {
  final List<MovieModel> movies;

  const PreviewsRow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Container(
              width: 90,
              height: 90,
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                
              ),
              child: ClipOval(
                child: TmdbImage(path: movies[index].posterPath, size: 'w200'),
              ),
            ),
          );
        },
      ),
    );
  }
}