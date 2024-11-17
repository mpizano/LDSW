class Movie {
  final String titulo;
  final int anio;
  final String director;
  final String genero;
  final String sinopsis;
  final String url;

  Movie({
    required this.titulo,
    required this.anio,
    required this.director,
    required this.genero,
    required this.sinopsis,
    required this.url,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      titulo: json['titulo'],
      anio: json['anio'],
      director: json['director'],
      genero: json['genero'],
      sinopsis: json['sinopsis'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'anio': anio,
      'director': director,
      'genero': genero,
      'sinopsis': sinopsis,
      'url': url,
    };
  }
}

