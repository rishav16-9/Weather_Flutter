import 'package:flutter/material.dart';
import 'package:weather/screen/search_box.dart';
import 'package:weather/widgets/common_swich_appbar.dart';

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
          actions: const [SettingPage()],
        ),
        body: const Search());
  }
}
