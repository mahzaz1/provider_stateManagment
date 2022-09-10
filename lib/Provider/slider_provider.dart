import 'package:flutter/foundation.dart';

class SliderProvider extends ChangeNotifier{
  double _sliderValue = 1.0;
  double get sliderValue => _sliderValue;

  void SetSlider(double val){
    _sliderValue = val;
    notifyListeners();
  }
}