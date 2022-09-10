import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/ThemeChanger.dart';

class ThemeChangerScreen extends StatefulWidget {
  const ThemeChangerScreen({Key? key}) : super(key: key);

  @override
  State<ThemeChangerScreen> createState() => _ThemeChangerScreenState();
}

class _ThemeChangerScreenState extends State<ThemeChangerScreen> {

  @override
  Widget build(BuildContext context) {
    final themeChangerProvider = Provider.of<ThemeChanger>(context);

    print('build');
    return Scaffold(
      appBar: AppBar(title: Text('Theme Changer'),),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text('Light Theme'),
              value: ThemeMode.light,
              groupValue: themeChangerProvider.themeMode,
              onChanged: themeChangerProvider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text('Dark Theme'),
              value: ThemeMode.dark,
              groupValue: themeChangerProvider.themeMode,
              onChanged: themeChangerProvider.setTheme,
          ),
          Switch(
            value: themeChangerProvider.isSwitched,
            onChanged: (value) {
             themeChangerProvider.toggleSwitch(value);


            },

          )


        ],
      ),
    );
  }
}
