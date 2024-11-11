import 'package:flutter/material.dart';
import '../api/weather_service.dart';
import '../models/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _controller = TextEditingController();
  Weather? _weather;
  String? _errorMessage;

  void _fetchWeather() async {
    try {
      final result = await _weatherService.fetchWeather(_controller.text);

      setState(() {
        _weather = result;
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "No se pudo encontrar el clima para esa ciudad";
        _weather = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consulta el Clima")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Ciudad",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text("Buscar Clima"),
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            if (_weather != null)
              Column(
                children: [
                  Text(
                    _weather!.cityName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${_weather!.temperature}°C",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    _weather!.description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
