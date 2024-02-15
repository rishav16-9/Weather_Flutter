import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/util/date_time.dart';
import 'package:weather/widgets/hourly_forecast.widget.dart';

class HourlyTenDay extends StatefulWidget {
  final WeatherModel? hourForecast;
  const HourlyTenDay({super.key, this.hourForecast});

  @override
  State<HourlyTenDay> createState() => _HourlyTenDayState();
}

class _HourlyTenDayState extends State<HourlyTenDay> {
  WeatherModel? hourForeCast;
  List<Hour>? hour;

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
