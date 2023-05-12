import 'dart:async';

import 'package:easy/src/domain/entities/weather.dart';
import 'package:easy/src/domain/repositories/history_repository.dart';
import 'package:easy/src/domain/repositories/weather_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetWeather extends UseCase<Weather, GetWeatherParams> {
  final WeatherRepository _weatherRepository;
  final HistoryRepository _historyRepository;

  GetWeather(this._weatherRepository, this._historyRepository);

  @override
  Future<Stream<Weather?>> buildUseCaseStream(GetWeatherParams? params) async {
    StreamController<Weather?> controller = StreamController();
    try {
      Weather? weather =
          await _weatherRepository.getWeather(params!.lat, params.lon);
      await _historyRepository.addHistory(weather!.lat);
      controller.add(weather);
      controller.close();
    } catch (e, st) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetWeatherParams {
  final String lat;
  final String lon;

  GetWeatherParams(this.lat, this.lon);
}
