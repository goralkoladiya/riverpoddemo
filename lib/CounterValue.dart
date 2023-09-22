import 'package:flutter/material.dart';

class CounterValue extends ChangeNotifier {

  int counter = 0;

  int get getCounterValue => counter;

  void increment() {

    counter += 1;

    notifyListeners();

  }

  void decrement() {

    counter -= 1;

    notifyListeners();

  }

}