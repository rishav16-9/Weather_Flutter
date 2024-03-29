import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/widgets/current_condition.widget.dart';
import 'package:weather/constants/string_constants.dart' as string_constants;

class CurrentCondition extends StatefulWidget {
  final WeatherModel? dayForecast;
  const CurrentCondition({super.key, this.dayForecast});

  @override
  State<CurrentCondition> createState() => _CurrentConditionState();
}

class _CurrentConditionState extends State<CurrentCondition> {
  WeatherModel? weatherModel;
  List<Forecastday>? days;
  @override
  void initState() {
    weatherModel = widget.dayForecast;
    days = weatherModel!.forecast!.forecastday;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (weatherModel != null) {
      return Container(
        child: GridView.count(
            crossAxisCount: 2,
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.3,
            children: <Widget>[
              CurrentData(
                title: string_constants.wind,
                mainValue:
                    '${weatherModel?.current?.windKph.toString()}${' Km/h'}',
                subValue: '${'Dir: '}${weatherModel?.current?.windDir}',
                image: 'wind',
              ),
              CurrentData(
                title: string_constants.humidity,
                mainValue:
                    '${weatherModel?.current?.humidity.toString()}${'%'}',
                subValue: '',
                image: 'humidity',
              ),
              CurrentData(
                title: string_constants.uvIndex,
                mainValue: weatherModel?.current?.uv.toString(),
                subValue: '',
                image: 'uv_index',
              ),
              CurrentData(
                title: string_constants.pressure,
                mainValue: weatherModel?.current?.pressureMb.toString(),
                subValue: 'mBar',
                image: 'pressure',
              ),
              CurrentData(
                title: string_constants.aqi,
                mainValue: weatherModel?.current?.airQuality?.pm25.toString(),
                subValue: '',
                image: 'aqi',
              ),
              CurrentData(
                  title: string_constants.sunriseSunset,
                  mainValue: '${days![0].astro?.sunrise}',
                  subValue: days![0].astro?.sunset,
                  image: 'sun')
            ]),
      );
    } else {
      return Container();
    }
  }
}
