import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:http/http.dart' as http;

// class WeatherProvider with ChangeNotifier {
//   final List<WeatherResponse> weatherdata =
//       []; // Change weatherdata to a non-nullable List<Weather>

//   Future<void> getWeather(String city) async {
//     weatherdata.clear();
//     print(city);
//     final String cityName = city; // Replace with desired city name
//     const String apiKey =
//         '3fc4ecbf5ca9569d7c2e4dd19db4338b'; // Replace with your API key
//     final String apiUrl =
//         'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         print(jsonData);

//         final weather = WeatherResponse.fromJson(jsonData);

//         weatherdata.add(weather);

//         notifyListeners();
//       } else {
//         throw Exception('Failed to load weather data');
//       }
//     } catch (e) {
//       print('Exception during API call: $e');
//     }
//   }

//   String formatUnixTimestamp(int? unixTimestamp) {
//     if (unixTimestamp != null) {
//       DateTime dateTime =
//           DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
//       return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
//     } else {
//       return '';
//     }
//   }
// }

class WeatherProvider with ChangeNotifier {
  final List<WeatherResponse> weatherdata = [];
  bool _hasError = false;

  bool get hasError => _hasError;

  Future<void> getWeather(String city) async {
    weatherdata.clear();
    _hasError = false; // Reset error status
    print(city);
    final String cityName = city; // Replace with desired city name
    const String apiKey =
        '3fc4ecbf5ca9569d7c2e4dd19db4338b'; // Replace with your API key
    final String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);

        final weather = WeatherResponse.fromJson(jsonData);

        weatherdata.add(weather);

        notifyListeners();
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Exception during API call: $e');
      _hasError = true; // Set error status
      notifyListeners();
    }
  }
}
