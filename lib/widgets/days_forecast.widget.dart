import 'package:flutter/material.dart';

class DaysForecastWidget extends StatefulWidget {
  final String? day;
  final String? image;
  final String? temperature;
  const DaysForecastWidget({super.key, this.day, this.image, this.temperature});

  @override
  State<DaysForecastWidget> createState() => _DaysForecastWidgetState();
}

class _DaysForecastWidgetState extends State<DaysForecastWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.day ?? ''),
                Image.network(widget.image ?? '', fit: BoxFit.contain),
                Text(widget.temperature ?? ''),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
