import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/movie.dart';

class ApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Obtener todas las películas como un Stream
  Stream<List<Movie>> getMovies() {
    return _firestore.collection('peliculas').snapshots().map(
          (snapshot) => snapshot.docs.map((doc) {
            // Asegúrate de manejar el ID del documento si es necesario
            final data = doc.data();
            return Movie.fromJson(data);
          }).toList(),
        );
  }

  // Agregar una nueva película
  Future<void> addMovie(Movie movie) async {
    await _firestore.collection('peliculas').add(movie.toJson());
  }

  // Eliminar una película por ID
  Future<void> deleteMovie(String id) async {
    await _firestore.collection('peliculas').doc(id).delete();
  }
}
