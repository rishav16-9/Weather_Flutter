import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/widgets/main_section.widget.dart';
import 'package:weather/util/date_time.dart';

class TemperatureSection extends StatefulWidget {
  final WeatherModel? weatherCurrentData;
  const TemperatureSection({key, this.weatherCurrentData}) : super(key: key);

  @override
  State<TemperatureSection> createState() => _TemperatureSectionState();
}

class _TemperatureSectionState extends State<TemperatureSection> {
  WeatherModel? weatherData;
  @override
  void initState() {
    weatherData = widget.weatherCurrentData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        margin: const EdgeInsets.all(10),
        child: MainSection(
          day: extractDayFromDateTime(
              weatherData?.forecast?.forecastday![0].date),
          condition: weatherData?.current?.condition?.text,
          feelsLike: '${weatherData?.current?.feelslikeC}',
          precip: '${weatherData?.current?.precipIn.toString()}',
          wind: '${weatherData?.current?.windKph.toString()}',
          humidity: '${weatherData?.current?.humidity}',
          temprature: '${weatherData?.current?.tempC.toString()}',
          image: '${'https:'}${weatherData?.current?.condition?.icon}',
        ));
  }
}
