import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';

class WeatherApi  {
  final http.Client httpAtmosy;

  WeatherApi({required this.httpAtmosy});

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final url = Uri.parse(
      '${AppConstants.baseUrl}/weather?q=$city&appid=${AppConstants.apiKey}&units=metric',
    );
    final response = await httpAtmosy.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error getting weather for $city');
    }
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> fetchForecast(String city) async {
    final url = Uri.parse(
      '${AppConstants.baseUrl}/forecast?q=$city&appid=${AppConstants.apiKey}&units=metric',
    );
    final response = await httpAtmosy.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error getting forecast for $city');
    }
    return jsonDecode(response.body);
  }
}