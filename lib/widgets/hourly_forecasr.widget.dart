import 'package:flutter/material.dart';

class HourlyForecastWidget extends StatefulWidget {
  final String? temperature;
  final String? image;
  final String? time;
  const HourlyForecastWidget(
      {super.key, this.image, this.temperature, this.time});

  @override
  State<HourlyForecastWidget> createState() => _HourlyForecastWidgetState();
}

class _HourlyForecastWidgetState extends State<HourlyForecastWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Container(
        child: Column(
          children: [
            Text(widget.temperature ?? ''),
            Image.network(widget.image ?? '', fit: BoxFit.cover),
            Text(widget?.time ?? '')
          ],
        ),
      ),
    );
  }
}
