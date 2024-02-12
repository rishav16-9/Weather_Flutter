import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/config/theme_provider.dart';
import 'package:weather/screen/home.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}
