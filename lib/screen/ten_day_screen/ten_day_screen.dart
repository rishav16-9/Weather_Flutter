import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/constants/string_constants.dart' as string_constants;
import 'package:weather/screen/ten_day_screen/condition_selected_day.dart';
import 'package:weather/screen/ten_day_screen/hourly_screen.dart';
import 'package:weather/screen/ten_day_screen/temp_screen.dart';

class TenDay extends StatefulWidget {
  final WeatherModel? weatherData;

  const TenDay({super.key, this.weatherData});

  @override
  State<TenDay> createState() => _TenDayState();
}

class _TenDayState extends State<TenDay> {
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
                child: TemperatureSectionForTen(
                  weatherData: weatherData,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      string_constants.hourlyForecast,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    HourlyTenDay(
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
                      string_constants.currentCondition,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    CurrentConditionSelectedDay(
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
