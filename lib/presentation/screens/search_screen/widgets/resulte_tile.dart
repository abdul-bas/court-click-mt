
import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/screens/search_screen/widgets/search_resulte_tile.dart';
import 'package:flutter/material.dart';

class ResulteTile extends StatelessWidget {
  const new({super.key, required this.title,required this.movies,required this.topBadge});
  final String title;
  final List<MovieModel> movies;
  final bool topBadge ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 14, 12, 10),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: movies.length,
            separatorBuilder: (_, __) => const SizedBox(height: 4),
            itemBuilder: (context, index) {
              return SearchResultTile(
                movie: movies[index],
                showTop10Badge: topBadge && index == 0,
              );
            },
          ),
        ),
      ],
    );
  }
}
