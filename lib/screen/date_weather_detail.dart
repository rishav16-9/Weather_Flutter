import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/screen/hourly_forecast.dart';
import 'package:weather/screen/temperature_ui.dart';
import 'package:weather/screen/weather_ui.dart';
import 'package:weather/widgets/hourly_forecasr.widget.dart';
import 'package:weather/widgets/main_section.widget.dart';

class DateCondition extends StatefulWidget {
  final String? place;
  final String? date;
  const DateCondition({super.key, this.place, this.date});

  @override
  State<DateCondition> createState() => _DateConditionState();
}

class _DateConditionState extends State<DateCondition> {
  bool isLoading = false;
  WeatherModel? weatherModel;
  String? place;
  String? date;
  List<Hour>? hour;

  @override
  void initState() {
    place = widget.place;
    date = widget.date;
    makeApiCall();
    super.initState();
  }

  void makeApiCall() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
    try {
      var response = await WeatherApiSDK().getWeatherReport(place!, date: date);
      Map<String, dynamic> responseBody = json.decode(response.body);
      var temp = await WeatherModel.fromJson(responseBody);
      setState(() {
        weatherModel = temp;
        isLoading = false;
        weatherModel!.forecast!.forecastday!.forEach((hourEle) {
          hour = hourEle.hour;
        });
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      log(e.toString());
    }
  }

  String extractTime(dateTimeString) {
    List<String> parts = dateTimeString.split(" ");
    String timePart = parts[1];
    List<String> timeParts = timePart.split(":");
    String hour = timeParts[0];
    String minute = timeParts[1];
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('10-Day Forecast'),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            !isLoading
                ? ((weatherModel != null &&
                        weatherModel?.current != null &&
                        weatherModel?.forecast != null &&
                        weatherModel?.location != null)
                    ? WeatherList(weatherData: weatherModel, screen: '10Day')
                    : Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(15),
                        child: const Text('Enter City')))
                : const Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        ),
      )),
    );
  }
}
