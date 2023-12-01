class MovieModel {
  final String title;
  final String backDropBath;
  final String posterPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final bool adult;

  MovieModel({
    required this.title,
    required this.backDropBath,
    required this.posterPath,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.adult,
  });

  factory MovieModel.fromJson(Map<String,dynamic>json) {
    return MovieModel(
      title: json['title'],
      backDropBath:json['backdrop_path'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date'],
      adult: json['adult'],
    );
  }

}
