import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  List<int> _history = [0];

  int get count => _count;
  List<int> get history => _history;

  void increment() {
    _count++;
    _history.add(_count);
    notifyListeners(); // UI update
  }

  void decrement() {
    if(_count>0) {
      _count--;
      _history.add(_count);
      notifyListeners();
    }
  }

  void clearAll() {
    _count = 0;
    _history.clear(); // সব history delete
    notifyListeners();
  }
}