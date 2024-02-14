import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather-model.model.dart';

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
    // !.forEach((day) {

    // });
    super.initState();
  }

  String extractTime(dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    // Format the DateTime object to get the day of the week
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
              return Container(
                child: Card(
                  child: Column(children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(extractTime(days![index].date)),
                          Image.network(
                              '${'https:'}${days![index].day!.condition?.icon}',
                              fit: BoxFit.contain),
                          Text(
                              '${days![index].day!.maxtempC}${" \u2103"}/${days![index].day!.mintempC}${" \u2103"}'),
                        ],
                      ),
                    )
                  ]),
                ),
              );
            }),
      );
    } else {
      return Container();
    }
    // return Padding(
    //   padding: const EdgeInsets.only(top: 7.0),
    //   child: Container(
    //     color: Colors.white70,
    //     height: 400,
    //     child: ListView.builder(
    // primary: false,
    // shrinkWrap: true,
    // physics: const NeverScrollableScrollPhysics(),
    // itemCount: days?.length,
    //         itemBuilder: (BuildContext context, index) {
    //           return Container(
    //             child: Column(
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: [
    // Text(extractTime(days![index].date)),
    // Text('${days![index].day!.maxtempC}${" \u2103"}'),
    // Image.network(
    //     '${'https:'}${days![index].day!.condition?.icon}',
    //     fit: BoxFit.cover),
    //                   ],
    //                 )
    //               ],
    //             ),
    //           );
    //         }),
    //   ),
    // );
  }
}
