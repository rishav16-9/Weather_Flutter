import 'package:flutter/material.dart';
import 'package:weather/screen/setting/change_theme.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ToggleTheme()));
        },
        icon: const Icon(Icons.settings_outlined));
  }
}
