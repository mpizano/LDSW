/* lib/screens/movies_screen.dart */
import 'package:flutter/material.dart';
import '../api/api_service.dart';
import '../models/movie.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Movie>> movies;

  @override
  void initState() {
    super.initState();
    movies = _apiService.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Catalog')),
      body: FutureBuilder<List<Movie>>(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No movies found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Movie movie = snapshot.data![index];
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text(movie.genre),
                );
              },
            );
          }
        },
      ),
    );
  }
}
