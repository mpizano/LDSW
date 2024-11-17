import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  final Map<String, dynamic> movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie['titulo'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie['url']),
            const SizedBox(height: 16),
            Text('Año: ${movie['anio']}'),
            Text('Director: ${movie['director']}'),
            Text('Género: ${movie['genero']}'),
            const SizedBox(height: 8),
            Text('Sinopsis: ${movie['sinopsis']}'),
          ],
        ),
      ),
    );
  }
}
