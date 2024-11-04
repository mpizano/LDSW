import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(movie.imageUrl),
            const SizedBox(height: 10),
            Text("Año: ${movie.year}"),
            Text("Director: ${movie.director}"),
            Text("Género: ${movie.genre}"),
            const SizedBox(height: 10),
            Text("Sinopsis: ${movie.synopsis}"),
          ],
        ),
      ),
    );
  }
}
