// lib/movie_list_page.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
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
    final response = await http
        .get(Uri.parse('http://localhost/LDSW/backend/get_movies.php'));
    setState(() {
      movies = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Catalog')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Popular Movies',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 120,
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              'Poster',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movies[index]['title'],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Genre: ${movies[index]['genre']}',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber),
                                  Text(
                                    'Rating: ${movies[index]['rating']}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
