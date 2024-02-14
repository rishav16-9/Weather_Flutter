import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/widgets/current_condition.widget.dart';

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
                title: 'Wind',
                mainValue:
                    '${weatherModel?.current?.windKph.toString()}${' Km/h'}',
                subValue: '${'Dir: '}${weatherModel?.current?.windDir}',
                image: 'wind',
              ),
              CurrentData(
                title: 'Humidity',
                mainValue:
                    '${weatherModel?.current?.humidity.toString()}${'%'}',
                subValue: '',
                image: 'humidity',
              ),
              CurrentData(
                title: 'UV Index',
                mainValue: weatherModel?.current?.uv.toString(),
                subValue: '',
                image: 'uv_index',
              ),
              CurrentData(
                title: 'Pressure',
                mainValue: weatherModel?.current?.pressureMb.toString(),
                subValue: 'mBar',
                image: 'pressure',
              ),
              CurrentData(
                title: 'Air Quality (PM25)',
                mainValue: weatherModel?.current?.airQuality?.pm25.toString(),
                subValue: '',
                image: 'aqi',
              ),
              CurrentData(
                  title: 'Sunrise & Sunset',
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
