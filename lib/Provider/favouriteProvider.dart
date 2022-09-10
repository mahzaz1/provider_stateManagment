import 'package:flutter/foundation.dart';

class FavouriteProvider extends ChangeNotifier{
  List<int> _selectedItem =[];
  List<int>  get selectedItem => _selectedItem;

void AddItems (int value){
  selectedItem.add(value);
  notifyListeners();
}

void RemoveItems (int value){
  selectedItem.remove(value);
  notifyListeners();
}

}