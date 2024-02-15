import 'package:flutter/material.dart';
import 'package:weather/constants/string_constants.dart' as string_constants;

class MainSection extends StatefulWidget {
  final String? temprature;
  final String? image;
  final String? feelsLike;
  final String? condition;
  final String? precip;
  final String? humidity;
  final String? wind;
  const MainSection(
      {super.key,
      this.condition,
      this.feelsLike,
      this.humidity,
      this.image,
      this.precip,
      this.temprature,
      this.wind});

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                        '${widget.temprature}${" \u2103"}',
                        style: const TextStyle(
                          fontSize: 36,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.network(widget.image ?? '', fit: BoxFit.cover),
                    ],
                  ),
                  Text(
                    '${string_constants.feelsLike}${': '}${widget.feelsLike}${" \u2103"}',
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
                    widget.condition ?? '',
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  Text(
                    '${string_constants.precip}${': '}${widget.precip.toString()}${"%"}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${string_constants.humidity}${': '}${widget.humidity}${"%"}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${string_constants.wind}${': '}${widget.wind.toString()}${"km/h"}',
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
