/* lib/api/api_service.dart */
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';

class ApiService {
  static const String _baseUrl = 'http://localhost/LDSW/backend/';

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/login.php"),
      body: jsonEncode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<List<Movie>> getMovies() async {
    final response = await http.get(Uri.parse("$_baseUrl/get_movies.php"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Movie.fromJson(data)).toList();
    } else {
      throw Exception('Error retrieving movies');
    }
  }
}


/*
class ApiService {
  static const String apiUrl = 'http://localhost/LDSW/backend/';

  Future<List<Movie>> getMovies() async {
    final response = await http.get(Uri.parse('$apiUrl/get_movies.php'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Movie.fromJson(data)).toList();
    } else {
      throw Exception('Error al obtener las películas');
    }
  }
}
*/