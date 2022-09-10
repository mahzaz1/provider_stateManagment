import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier{

  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  bool _isSwitched = true;
  bool get isSwitched => _isSwitched;


  void setTheme(themee){
    _themeMode = themee;
    notifyListeners();
  }

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
        _isSwitched = true;
    }
    else
    {
        _isSwitched = false;
    }
    notifyListeners();

  }

}