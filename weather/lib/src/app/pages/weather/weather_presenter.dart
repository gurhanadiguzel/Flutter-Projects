import 'package:easy/src/domain/entities/weather.dart';
import 'package:easy/src/domain/repositories/history_repository.dart';
import 'package:easy/src/domain/repositories/weather_repository.dart';
import 'package:easy/src/domain/usecases/get_weather.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class WeatherPresenter extends Presenter {
  late final Function getWeatherOnNext;
  late final Function getWeatherOnError;

  final GetWeather _getWeather;

  WeatherPresenter(
    WeatherRepository weatherRepository,
    HistoryRepository historyRepository,
  ) : _getWeather = GetWeather(weatherRepository, historyRepository);

  void getWeather(String lat, String lon) {
    _getWeather.execute(_GetWeatherObserver(this), GetWeatherParams(lat, lon));
  }

  @override
  void dispose() {
    _getWeather.dispose();
  }
}

class _GetWeatherObserver extends Observer<Weather> {
  final WeatherPresenter _presenter;

  _GetWeatherObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getWeatherOnError(e);
  }

  @override
  void onNext(Weather? response) {
    print('prensenter');
    _presenter.getWeatherOnNext(response);
  }
}
