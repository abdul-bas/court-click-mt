import 'package:court_click/core/utils/date_utils/short_date.dart';
import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/screens/home_screen/widgets/tmdb_image.dart';
import 'package:flutter/material.dart';

class NewArrivalTile extends StatelessWidget {
  final MovieModel movie;

  const NewArrivalTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
      
          
        
          child: Row(
            children: [
              SizedBox(
                width: 110,
                height: 70,
                child: TmdbImage(
                  path: movie.backdropPath ?? movie.posterPath,
                  size: 'w300',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'New Arrival',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      movie.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      shortDate(movie.releaseDate),
                      style: const TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}