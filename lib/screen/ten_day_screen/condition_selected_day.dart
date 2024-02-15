import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';
import 'package:weather/widgets/current_condition.widget.dart';
import 'package:weather/constants/string_constants.dart' as string_constants;

class CurrentConditionSelectedDay extends StatefulWidget {
  final WeatherModel? dayForecast;

  const CurrentConditionSelectedDay({super.key, this.dayForecast});

  @override
  State<CurrentConditionSelectedDay> createState() =>
      _CurrentConditionSelectedDayState();
}

class _CurrentConditionSelectedDayState
    extends State<CurrentConditionSelectedDay> {
  WeatherModel? weatherModel;
  Day? avgDetail;
  Astro? sunDetail;
  @override
  void initState() {
    weatherModel = widget.dayForecast;
    weatherModel!.forecast!.forecastday!.forEach((element) {
      avgDetail = element.day;
      sunDetail = element.astro;
    });
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
                mainValue: '${avgDetail?.maxwindKph.toString()}${' Km/h'}',
                subValue: '',
                image: 'wind',
              ),
              CurrentData(
                title: string_constants.humidity,
                mainValue: '${avgDetail?.avghumidity.toString()}${'%'}',
                subValue: '',
                image: 'humidity',
              ),
              CurrentData(
                title: string_constants.uvIndex,
                mainValue: avgDetail?.uv.toString(),
                subValue: '',
                image: 'uv_index',
              ),
              CurrentData(
                title: string_constants.pressure,
                mainValue: weatherModel?.current?.precipIn.toString(),
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
                  mainValue: '${sunDetail?.sunrise}',
                  subValue: sunDetail?.sunset,
                  image: 'sun')
            ]),
      );
    } else {
      return Container();
    }
  }
}
