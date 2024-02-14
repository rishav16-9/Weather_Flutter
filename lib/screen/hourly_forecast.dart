import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';

class HourlyForecast extends StatefulWidget {
  final WeatherModel? hourForecast;
  const HourlyForecast({key, this.hourForecast}) : super(key: key);

  @override
  State<HourlyForecast> createState() => _HourlyForecastState();
}

class _HourlyForecastState extends State<HourlyForecast> {
  WeatherModel? hourForeCast;
  List<Hour>? hour;

  String extractTime(dateTimeString) {
    List<String> parts = dateTimeString.split(" ");
    String timePart = parts[1];
    List<String> timeParts = timePart.split(":");
    String hour = timeParts[0];
    String minute = timeParts[1];
    return '$hour:$minute';
  }

  @override
  void initState() {
    hourForeCast = widget.hourForecast;
    hourForeCast!.forecast!.forecastday!.forEach((hourEle) {
      hour = hourEle.hour;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Container(
        color: Colors.white70,
        // decoration: BoxDecoration(),
        height: 121,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hour?.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Container(
                  child: Column(
                    children: [
                      Text('${hour![index].tempC}${" \u2103"}'),
                      Image.network(
                          '${'https:'}${hour![index].condition?.icon}',
                          fit: BoxFit.cover),
                      Text(extractTime(hour![index].time))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
