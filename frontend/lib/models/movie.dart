/// lib/models/movie.dart
class Movie {
  final String title;
  final int year;
  final String director;
  final String genre;
  final String synopsis;
  final String imageUrl;

  Movie({
    required this.title,
    required this.year,
    required this.director,
    required this.genre,
    required this.synopsis,
    required this.imageUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      year: json['year'],
      director: json['director'],
      genre: json['genre'],
      synopsis: json['synopsis'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'year': year,
        'director': director,
        'genre': genre,
        'synopsis': synopsis,
        'image_url': imageUrl,
      };
}
