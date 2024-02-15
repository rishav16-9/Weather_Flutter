import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/widgets/hourly_forecasr.widget.dart';

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
        decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        // color: Colors.white70,
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
    );
  }
}
