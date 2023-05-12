import 'dart:convert';

import 'package:easy/src/domain/entities/weather.dart';
import 'package:easy/src/domain/repositories/weather_repository.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

class DataWeatherRepository implements WeatherRepository {
  @override
  Future<Weather?> getWeather(String lat, String lon) async {
    try {
      String id = 'cd1919109f90bcb648906b915b2042e7';
      final response = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$id'),
      );
      final data = jsonDecode(response.body);

      Weather weather = Weather.fromJson(data);
      return weather;
    } catch (e, st) {
      print(e);
      print(st);
    }
  }
}
