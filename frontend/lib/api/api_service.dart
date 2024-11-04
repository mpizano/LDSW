import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';

class ApiService {
  final String baseUrl = 'http://localhost/catalogo_peliculas/backend/';

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("${baseUrl}login.php"),
      body: jsonEncode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Error en la conexión");
    }
  }

  Future<List<Movie>> getMovies() async {
    final response = await http.get(Uri.parse("${baseUrl}get_movies.php"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Movie.fromJson(data)).toList();
    } else {
      throw Exception("Error al obtener el catálogo");
    }
  }

  Future<Map<String, dynamic>> addMovie(Movie movie) async {
    final response = await http.post(
      Uri.parse("${baseUrl}add_movie.php"),
      body: jsonEncode(movie.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> deleteMovie(int id) async {
    final response = await http.post(
      Uri.parse("${baseUrl}delete_movie.php"),
      body: jsonEncode({'id': id}),
      headers: {'Content-Type': 'application/json'},
    );

    return json.decode(response.body);
  }
}
