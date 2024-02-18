import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/widgets/hourly_forecast.widget.dart';
import 'package:weather/util/date_time.dart';

class HourlyForecast extends StatefulWidget {
  final WeatherModel? hourForecast;
  const HourlyForecast({key, this.hourForecast}) : super(key: key);

  @override
  State<HourlyForecast> createState() => _HourlyForecastState();
}

class _HourlyForecastState extends State<HourlyForecast> {
  WeatherModel? hourForeCast;
  List<Hour>? hour;

  @override
  void initState() {
    hourForeCast = widget.hourForecast;
    var date = DateTime.now();
    var day =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    for (var hourEle in hourForeCast!.forecast!.forecastday!) {
      if (day.toString() == hourEle.date) {
        hour = hourEle.hour;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Card(
        child: Container(
          height: 121,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hour?.length ?? 0,
              itemBuilder: (BuildContext context, index) {
                return HourlyForecastWidget(
                  temperature: '${hour![index].tempC}${" \u2103"}',
                  image: '${'https:'}${hour![index].condition?.icon}',
                  time: extractTime(hour![index].time),
                );
              }),
        ),
      ),
    );
  }
}
