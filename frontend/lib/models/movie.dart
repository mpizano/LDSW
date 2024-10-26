/* lib/models/movie.dart */
class Movie {
  final int id;
  final String title;
  final String genre;

  Movie({required this.id, required this.title, required this.genre});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      genre: json['genre'],
    );
  }
}
