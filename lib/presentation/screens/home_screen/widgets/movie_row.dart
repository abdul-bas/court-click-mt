
import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/home_label.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/tmdb_image.dart';
import 'package:flutter/material.dart';

class MovieRow extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;
  final bool ranked; 
  const MovieRow({
    super.key,
    required this.title,
    required this.movies,
    this.ranked = false,
  });

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();
    final items = ranked ? movies.take(10).toList() : movies;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeLabelWidget(title),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final movie = items[index];
              return ranked
                  ?SizedBox(
      width: 150,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: -12,
            child: Text(
              '$index+1',
              style: TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.w900,
                height: 1,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = Colors.grey.shade400,
              ),
            ),
          ),
          Positioned(
            right: 6,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                width: 100,
                child: TmdbImage(path: movie.posterPath),
              ),
            ),
          ),
        ],
      ))
    
                  :Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          width: 105,
          height: 150,
          child: TmdbImage(path: movie.posterPath),
        ),
      ),
    );
            },
          ),
        ),
      ],
    );
  }

}