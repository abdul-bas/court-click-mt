class MovieModel {
  final int id;
  final String title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;     
  final List<int> genreIds;       

  MovieModel({
    required this.id,
    required this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,                  
    this.genreIds = const [],           
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int,
      title: (json['title'] ?? json['name'] ?? '') as String,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
    
      releaseDate:
          (json['release_date'] ?? json['first_air_date']) as String?,
      genreIds: (json['genre_ids'] as List?)
              ?.map((e) => e as int)
              .toList() ??
          [],
    );
  }
}