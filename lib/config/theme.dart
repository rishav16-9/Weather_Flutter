import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  primarySwatch: Colors.red,
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
    onPrimary: Colors.black,
    secondary: Colors.grey,
    onSecondary: Colors.black,
    background: Colors.white70, //white70
    surface: Colors.white,
    onBackground: Colors.black,
    onError: Colors.white,
    error: Colors.red,
    onSurface: Colors.black,
  ),
);

ThemeData darkMode = ThemeData(
  primarySwatch: Colors.red,
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: Colors.blueAccent,
    onSecondary: Colors.white,
    background: Colors.purpleAccent.shade100,
    surface: Colors.grey,
    onBackground: Colors.white,
    onError: Colors.red,
    error: Colors.red,
    onSurface: Colors.white,
  ),
);

// class Styles {
//   static ThemeData themeData(bool isDarkTheme, BuildContext context) {
//     return ThemeData(
//       primarySwatch: Colors.red,
//       primaryColor: isDarkTheme ? Colors.black : Colors.white,
//       colorScheme: ColorScheme(
//         primary: isDarkTheme ? Colors.black : Colors.white,
//         secondary:
//             isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
//         surface:
//             isDarkTheme ? const Color(0xffF1F5FB) : const Color(0xFF151515),
//         background:
//             isDarkTheme ? const Color(0xFF151515) : const Color(0xffF1F5FB),
//         error: Colors.red,
//         onPrimary: Colors.white,
//         onSecondary: Colors.black,
//         onSurface: Colors.black,
//         onBackground: Colors.black,
//         onError: Colors.white,
//         brightness: isDarkTheme ? Brightness.dark : Brightness.light,
//       ),
//       indicatorColor:
//           isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
//       hintColor:
//           isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),
//       highlightColor:
//           isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
//       hoverColor:
//           isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
//       focusColor:
//           isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
//       disabledColor: Colors.grey,
//       cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
//       canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
//       brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      // buttonTheme: Theme.of(context).buttonTheme.copyWith(
      //     colorScheme: isDarkTheme
      //         ? const ColorScheme.dark()
      //         : const ColorScheme.light()),
//       appBarTheme: AppBarTheme(
//         backgroundColor: isDarkTheme ? Colors.black : Colors.white,
//       ),
//     );
//   }
// }
