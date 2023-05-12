import 'package:easy/src/app/pages/weather/weather_controller.dart';
import 'package:easy/src/app/pages/history/history_view.dart';
import 'package:easy/src/app/pages/weather/weather_controller.dart';
import 'package:easy/src/data/repositories/data_history_reopositories.dart';
import 'package:easy/src/data/repositories/data_weather_repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class WeatherView extends View {
  @override
  State<StatefulWidget> createState() {
    return _WeatherViewState(
        WeatherController(DataWeatherRepository(), DataHistoryRepositories()));
  }
}

class _WeatherViewState extends ViewState<WeatherView, WeatherController> {
  _WeatherViewState(WeatherController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Container(
              height: 50,
              width: size.width,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'WEATHER',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.history_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: ((context) => HistoryView()),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: size.width - 150,
              child: ControlledWidgetBuilder<WeatherController>(
                builder: (context, controller) {
                  return TextField(
                    onChanged: (lat) {
                      controller.setLat(lat);
                    },
                  );
                },
              ),
            ),
            Container(
              width: size.width - 150,
              child: ControlledWidgetBuilder<WeatherController>(
                builder: (context, controller) {
                  return TextField(
                    onChanged: (lon) {
                      controller.setLon(lon);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            ControlledWidgetBuilder<WeatherController>(
              builder: (context, controller) {
                return TextButton(
                  onPressed: () {
                    controller.getWeather();
                  },
                  child: Text('HIT ME'),
                );
              },
            ),
            Container(
              width: size.width - 150,
              alignment: Alignment.centerLeft,
              child: ControlledWidgetBuilder<WeatherController>(
                builder: (context, controller) {
                  if (controller.weather == null) {
                    return Text(' ');
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.weather!.lat +
                              '\n' +
                              controller.weather!.lon +
                              ':\n\n' +
                              controller.weather!.condition +
                              '\n\n\n',
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
