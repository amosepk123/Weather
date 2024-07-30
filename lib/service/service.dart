import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Weather_model.dart';

class WeatherServices {
  final String apiKey = '9b4e19a144e586e081ce7d8c427eb4fd';

  Future<WeatherData> fetchWeather(double lat, double lon) async {
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<WeatherData> fetchWeatherByCity(String cityName) async {
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data for city: $cityName');
    }
  }
}
