import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/screen/date_weather_detail.dart';
import 'package:weather/widgets/days_forecast.widget.dart';

class DaysForecast extends StatefulWidget {
  final WeatherModel? dayForecast;
  const DaysForecast({key, this.dayForecast}) : super(key: key);

  @override
  State<DaysForecast> createState() => _DaysForecastState();
}

class _DaysForecastState extends State<DaysForecast> {
  WeatherModel? weatherModel;
  List<Forecastday>? days;
  @override
  void initState() {
    weatherModel = widget.dayForecast;
    days = weatherModel!.forecast!.forecastday;
    super.initState();
  }

  String extractTime(dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDayOfWeek = DateFormat.EEEE().format(dateTime);
    return formattedDayOfWeek;
  }

  @override
  Widget build(BuildContext context) {
    if (weatherModel != null) {
      return Container(
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: days?.length,
          itemBuilder: (BuildContext cntxt, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DateCondition(
                        place: weatherModel?.location?.name,
                        date: days![index].date),
                  ),
                );
              },
              child: DaysForecastWidget(
                  day: extractTime(days![index].date),
                  image: '${'https:'}${days![index].day!.condition?.icon}',
                  temperature:
                      '${days![index].day!.maxtempC}${" \u2103"}/${days![index].day!.mintempC}${" \u2103"}'),
            );
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
