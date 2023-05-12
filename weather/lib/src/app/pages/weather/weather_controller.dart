import 'package:easy/src/app/pages/Weather/Weather_presenter.dart';
import 'package:easy/src/domain/entities/weather.dart';
import 'package:easy/src/domain/repositories/history_repository.dart';
import 'package:easy/src/domain/repositories/weather_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class WeatherController extends Controller {
  final WeatherPresenter _presenter;

  WeatherController(
    WeatherRepository weatherRespository,
    HistoryRepository historyRepository,
  ) : _presenter = WeatherPresenter(
          weatherRespository,
          historyRepository,
        );

  Weather? weather;
  String? lat;
  String? lon;

  @override
  void initListeners() {
    _presenter.getWeatherOnNext = (Weather response) {
      weather = response;
      refreshUI();
    };

    _presenter.getWeatherOnError = (e) {};
  }

  void getWeather() {
    _presenter.getWeather(lat!, lon!);
  }

  void setLat(String value) {
    lat = value;
  }

  void setLon(String value) {
    lon = value;
  }
}
