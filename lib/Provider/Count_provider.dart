import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class CountProvider extends ChangeNotifier{

  int _count = 0;
  int get count => _count;

void setCont(){
  _count++;
  notifyListeners();
}




}