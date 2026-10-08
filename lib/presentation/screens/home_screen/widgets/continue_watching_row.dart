import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/tmdb_image.dart';
import 'package:flutter/material.dart';

class ContinueWatchingRow extends StatelessWidget {
  final List<MovieModel> movies;

  const ContinueWatchingRow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                    width: 160,
                    height: 100,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        TmdbImage(
                          path: movies[index].backdropPath,
                          size: 'w300',
                        ),

                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: LinearProgressIndicator(
                            value: ((index * 13) % 80 + 15) / 100,
                            minHeight: 3,
                            backgroundColor: Colors.white24,
                            color: const Color(0xFFE50914),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline_rounded),
                    Icon(Icons.more_vert),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
