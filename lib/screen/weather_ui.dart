import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/screen/current_condtion.dart';
import 'package:weather/screen/days_forecast.dart';
import 'package:weather/screen/hourly_forecast.dart';
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
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hourly Forecast',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    HourlyForecast(
                      hourForecast: weatherData,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '10-Day Forecast',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    DaysForecast(
                      dayForecast: weatherData,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Current Condition',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    CurrentCondition(
                      dayForecast: weatherData,
                    ),
                  ],
                ),
              ),
              // CurrentData()
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
