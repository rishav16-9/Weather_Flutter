import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/config/theme_provider.dart';
import 'package:weather/src/app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const WeatherApp(),
    ),
  );
}
