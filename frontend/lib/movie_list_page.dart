/* lib/movie_list_page.dart */
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final response =
        await http.get(Uri.parse('http://localhost/get_movies.php'));
    setState(() {
      movies = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Catalog')),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(movies[index]['title']),
            subtitle: Text(movies[index]['genre']),
          );
        },
      ),
    );
  }
}
