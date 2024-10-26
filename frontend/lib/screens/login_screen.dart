// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import '../api/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  void _login() async {
    try {
      final response = await _apiService.login(
        _usernameController.text,
        _passwordController.text,
      );

      if (!mounted) return; // Verifica si el widget sigue montado antes de usar BuildContext.

      if (response['status'] == 'success') {
        // Login exitoso
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );
      } else {
        // Error en login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );
      }
    } catch (e) {
      if (!mounted) return; // Verifica nuevamente antes de usar BuildContext.

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error connecting to the server')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.symmetric(horizontal: 40.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: _login,
                            child: const Text("Login"),
                          ),
                          TextButton(
                            onPressed: () {
                              // Acción de "Forgot Password"
                            },
                            child: const Text("Forgot Password?"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
