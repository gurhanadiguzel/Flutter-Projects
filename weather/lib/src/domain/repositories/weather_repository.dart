import 'package:easy/src/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather?> getWeather(String lat, String lon);
}
