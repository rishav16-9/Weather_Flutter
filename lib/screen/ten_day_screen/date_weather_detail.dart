import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/screen/ten_day_screen/ten_day_screen.dart';
import 'package:weather/constants/string_constants.dart' as string_constants;

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
  String? errorMessage;

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
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        var temp = await WeatherModel.fromJson(responseBody);
        setState(() {
          weatherModel = temp;
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = response.body;
          isLoading = true;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      log(e.toString());
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('10-Day Forecast'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          !isLoading
              ? ((weatherModel != null &&
                      weatherModel?.current != null &&
                      weatherModel?.forecast != null &&
                      weatherModel?.location != null)
                  ? TenDay(weatherData: weatherModel,)
                  // WeatherList(weatherData: weatherModel, screen: '10Day')
                  : Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(15),
                      child: Text(errorMessage != null
                          ? errorMessage.toString()
                          : string_constants.enterCity)))
              : const Center(
                  heightFactor: 20,
                  child: CircularProgressIndicator(),
                )
        ],
      )),
    );
  }
}
