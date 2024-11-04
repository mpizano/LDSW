import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'movie_detail_screen.dart';

class CatalogScreen extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: "Película 1",
      year: 2021,
      director: "Director 1",
      genre: "Acción",
      synopsis: "Sinopsis de la película 1.",
      imageUrl: "assets/images/movie1.jpg",
    ),
  ];

  // Elimina 'const' del constructor
  CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catálogo de Películas")),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            title: Text(movie.title),
            leading: Image.asset(movie.imageUrl),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
