import 'package:flutter/material.dart';
import 'package:weather/model/weather-model.model.dart';

class TemperatureSection extends StatefulWidget {
  final WeatherModel? weatherCurrentData;
  const TemperatureSection({key, this.weatherCurrentData}) : super(key: key);

  @override
  State<TemperatureSection> createState() => _TemperatureSectionState();
}

class _TemperatureSectionState extends State<TemperatureSection> {
  WeatherModel? weatherData;
  @override
  void initState() {
    weatherData = widget.weatherCurrentData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white70,
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Now',
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${weatherData?.current?.tempC.toString()}${" \u2103"}',
                        style: const TextStyle(
                          fontSize: 36,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.network(
                          '${'https:'}${weatherData?.current?.condition?.icon}',
                          fit: BoxFit.cover),
                    ],
                  ),
                  Text(
                    '${'Feels Like'}${weatherData?.current?.feelslikeC}${" \u2103"}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    weatherData?.current?.condition?.text ?? '',
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  Text(
                    '${'Precip: '}${weatherData?.current?.precipIn.toString()}${"%"}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${'Humidity: '}${weatherData?.current?.humidity}${"%"}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${'Wind: '}${weatherData?.current?.windKph.toString()}${"km/h"}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
