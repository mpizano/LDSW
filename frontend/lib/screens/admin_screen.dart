import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Administrar Catálogo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Funcionalidades para agregar o eliminar películas"),
            ElevatedButton(
              onPressed: () {
                // Lógica para agregar películas
              },
              child: const Text("Agregar Película"),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para eliminar películas
              },
              child: const Text("Eliminar Película"),
            ),
          ],
        ),
      ),
    );
  }
}
