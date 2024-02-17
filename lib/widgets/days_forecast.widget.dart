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
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.day ?? ''),
                  Row(
                    children: [
                      Image.network(widget.image ?? '', fit: BoxFit.contain),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(widget.temperature ?? ''),
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
