import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int numbercounter;
  CounterModel({this.numbercounter = 0});

  void increment() {
    numbercounter++;
    notifyListeners();
  }

  void decrement() {
    numbercounter--;
    notifyListeners();
  }
}
