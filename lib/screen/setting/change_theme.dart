import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/config/theme_provider.dart';
import 'package:weather/constants/string_constants.dart' as string_constants;

class ToggleTheme extends StatefulWidget {
  const ToggleTheme({super.key});

  @override
  State<ToggleTheme> createState() => _ToggleThemeState();
}

class _ToggleThemeState extends State<ToggleTheme> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text(string_constants.setting),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                string_constants.toggleTheme,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    !isDarkMode
                        ? string_constants.swichTheme
                        : string_constants.swichThemeLight,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: Provider.of<ThemeProvider>(context, listen: true)
                        .isDarkMode,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
