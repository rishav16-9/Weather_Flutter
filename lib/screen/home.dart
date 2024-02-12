import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/config/theme_provider.dart';
import 'package:weather/screen/search_box.dart';

class MyHomePage extends StatefulWidget {
  final String? title;
  const MyHomePage({Key? key, this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? ''),
          actions: [
            Switch(
              value:
                  Provider.of<ThemeProvider>(context, listen: true).isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
            ),
          ],
        ),
        body: const Search());
  }
}
