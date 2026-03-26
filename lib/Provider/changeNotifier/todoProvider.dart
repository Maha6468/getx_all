import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  List<String> _tasks = [];

  List<String> get tasks => _tasks;

  void addTask(String task) {
    if (task.trim().isNotEmpty) {
      _tasks.add(task);
      notifyListeners();
    }
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void clearAll() {
    _tasks.clear();
    notifyListeners();
  }
}