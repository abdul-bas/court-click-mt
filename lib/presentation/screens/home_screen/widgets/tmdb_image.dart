

import 'package:flutter/material.dart';

class TmdbImage extends StatelessWidget {
  final String? path;
  final String size; 

  const TmdbImage({super.key, required this.path, this.size = 'w300'});

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      color: Colors.grey.shade900,
      child: const Icon(Icons.movie, color: Colors.white24),
    );

    if (path == null) return placeholder;

    return Image.network(
      'https://image.tmdb.org/t/p/$size$path',
      fit: BoxFit.cover,
      errorBuilder:(context, error, stackTrace)  => placeholder,
    );
  }
}
