import 'package:court_click/core/constants/genres.dart';
import 'package:court_click/core/utils/date_utils/long_date.dart';
import 'package:court_click/core/utils/helpers/get_tags.dart';
import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/screens/coming_soon_screen/widgets/action_widget.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/tmdb_image.dart';
import 'package:flutter/material.dart';

class ComingSoonCard extends StatelessWidget {
  final MovieModel movie;
  final bool reminded;
  final VoidCallback onRemind;

  const ComingSoonCard({
    super.key,
    required this.movie,
    required this.reminded,
    required this.onRemind,
  });

  @override
  Widget build(BuildContext context) {
    final tags = getTags(movie);

    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: SizedBox.expand(
              child: TmdbImage(
                path: movie.backdropPath ?? movie.posterPath,
                size: 'w780',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 20, 12, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                action(
                  reminded ? Icons.notifications_active : Icons.notifications,
                  reminded ? 'Reminded' : 'Remind Me',
                  onRemind,
                  color: reminded ? const Color(0xFFE50914) : Colors.white,
                ),
                const SizedBox(width: 22),
                action(Icons.share, 'Share', () {}),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Coming ${longDate(movie.releaseDate)}',
                  style: const TextStyle(color: Colors.white54, fontSize: 11),
                ),
                const SizedBox(height: 6),
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                if ((movie.overview ?? '').isNotEmpty)
                  Text(
                    movie.overview!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      height: 1.35,
                    ),
                  ),
                const SizedBox(height: 10),
                if (tags.isNotEmpty)
                  Text(
                    tags.join('  •  '),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
