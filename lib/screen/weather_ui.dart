import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/screen/temperature_ui.dart';

class WeatherList extends StatefulWidget {
  final WeatherModel? weatherData;
  const WeatherList({key, this.weatherData}) : super(key: key);

  @override
  State<WeatherList> createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  WeatherModel? weatherData;
  @override
  void initState() {
    weatherData = widget.weatherData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (weatherData != null) {
      return SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: TemperatureSection(
                  weatherCurrentData: weatherData,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
