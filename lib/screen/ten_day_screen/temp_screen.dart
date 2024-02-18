import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/util/date_time.dart';
import 'package:weather/widgets/main_section.widget.dart';

class TemperatureSectionForTen extends StatefulWidget {
  final WeatherModel? weatherData;

  const TemperatureSectionForTen({super.key, this.weatherData});

  @override
  State<TemperatureSectionForTen> createState() =>
      _TemperatureSectionForTenState();
}

class _TemperatureSectionForTenState extends State<TemperatureSectionForTen> {
  WeatherModel? weatherData;
  Day? avgDetail;

  @override
  void initState() {
    weatherData = widget.weatherData;
    for (var element in weatherData!.forecast!.forecastday!) {
      avgDetail = element.day;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        child: MainSection(
          day: extractDayFromDateTime(
              weatherData?.forecast?.forecastday![0].date),
          condition: avgDetail?.condition?.text,
          feelsLike: '${avgDetail?.avgtempC}',
          precip: '${avgDetail?.totalprecipIn.toString()}',
          wind: '${avgDetail?.maxwindKph}',
          humidity: '${avgDetail?.avghumidity}',
          temprature: '${avgDetail?.maxtempC?.toString()}',
          image: '${'https:'}${avgDetail?.condition?.icon}',
        ));
  }
}
