import 'package:court_click/core/constants/genres.dart';
import 'package:court_click/data/model/movie_model.dart';
List<String> getTags(MovieModel movies) {
  return movies.genreIds
        .map((id) => genres[id])
        .whereType<String>()
        .take(5)
        .toList();
  
}