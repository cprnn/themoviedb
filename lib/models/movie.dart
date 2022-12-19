class Movie {
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final String title;
  final double voteAverage;

  Movie({
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      posterPath:
          json['poster_path'] != null ? json['poster_path'] as String : "",
      backdropPath:
          json['backdrop_path'] != null ? json['backdrop_path'] as String : "",
      releaseDate: json['release_date'] as String,
      title: json['title'] as String,
      voteAverage: json['vote_average'].toDouble() as double,
    );
  }
}
