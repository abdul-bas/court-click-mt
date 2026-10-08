
import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/tmdb_image.dart';
import 'package:flutter/material.dart';

class SearchResultTile extends StatelessWidget {
  final MovieModel movie;
  final bool showTop10Badge;

  const SearchResultTile({
    super.key,
    required this.movie,
    this.showTop10Badge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color(0xFF3A3A3A),
      child: Row(
        children: [
        
          SizedBox(
            width: 125,
            height: 80,
            child: Stack(
              fit: StackFit.expand,
              children: [
                TmdbImage(
                  path: movie.backdropPath ?? movie.posterPath,
                  size: 'w300',
                ),
                const Positioned(
                  top: 4,
                  left: 5,
                  child: Text(
                    'N',
                    style: TextStyle(
                      color: Color(0xFFE50914),
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                if (showTop10Badge)
                  Positioned(
                    top: 0,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 2,
                      ),
                      color: const Color(0xFFE50914),
                      child: const Column(
                        children: [
                          Text(
                            'TOP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 6,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                          Text(
                            '10',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(flex: 3,
            child: Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Expanded( flex: 1, child: SizedBox()),
          const Padding(
            padding: EdgeInsets.only(right: 14),
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
