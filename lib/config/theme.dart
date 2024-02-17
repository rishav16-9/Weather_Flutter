import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  primarySwatch: Colors.red,
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: Colors.black,
    onPrimary: Colors.black,
    secondary: Colors.grey,
    onSecondary: Colors.black,
    background: Colors.yellowAccent.shade100, //white70
    surface: Colors.yellow.shade400,
    onBackground: Colors.black,
    onError: Colors.red,
    error: Colors.red,
    onSurface: Colors.black,
  ),
  appBarTheme: const AppBarTheme(color: Color.fromRGBO(255, 213, 79, 1)),
);

ThemeData darkMode = ThemeData(
  primarySwatch: Colors.red,
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.black,
    onSecondary: Colors.white,
    background: Color.fromARGB(255, 51, 51, 51),
    surface: Colors.black45,
    onBackground: Colors.white,
    onError: Colors.red,
    error: Colors.red,
    onSurface: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.black,
  ),
);
