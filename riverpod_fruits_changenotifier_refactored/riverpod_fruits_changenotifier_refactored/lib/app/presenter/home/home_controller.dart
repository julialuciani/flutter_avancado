import 'package:flutter/foundation.dart';

class FavoritesController extends ChangeNotifier{
  String fruit = 'unknown';

  changeFruit(String newFruit){
    fruit = newFruit;
    notifyListeners();
  }
}