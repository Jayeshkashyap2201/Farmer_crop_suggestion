
import 'dart:convert';
import 'package:farmer_voice_assistant/widgets/global.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  static final WeatherApi _instance = WeatherApi._internal();
  factory WeatherApi() => _instance;
  WeatherApi._internal();

  static String temp = "";
  static String condition = "";
  static String wind = "";
  static String windDirection = "";
  static String humidity = "";
  static String cloud = "";
  static String heatIndex = "";
  static String dewPoint = "";
  static String gust = "";

  Future<void> fetchWeather() async {
    try {
      final response = await http.get(Uri.parse(
          "http://api.weatherapi.com/v1/current.json?key=92ca47c55fe640baa5f41315252403&q=$selectedItemGlobal&aqi=no"));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        temp = data["current"]["temp_c"]?.toString() ?? "N/A";
        condition = data["current"]["condition"]?["text"] ?? "Unknown";
        wind = data["current"]["wind_kph"]?.toString() ?? "N/A";
        windDirection = data["current"]["wind_dir"] ?? "Unknown";
        humidity = data["current"]["humidity"]?.toString() ?? "N/A";
        cloud = data["current"]["cloud"]?.toString() ?? "N/A";
        heatIndex = data["current"]["feelslike_c"]?.toString() ?? "N/A";
        dewPoint = data["current"]["dewpoint_c"]?.toString() ?? "N/A";
        gust = data["current"]["gust_kph"]?.toString() ?? "N/A";
      }
      else {
        print("Failed to fetch weather data.");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
