import 'package:flutter/material.dart';


import '../Models/Habits.dart';
import '../Models/HabitList.dart';


final textController = TextEditingController();

class HabitController extends ChangeNotifier
{

  var _model = HabitData();

  DateTime now = DateTime.now();

  void submitHabit() {
    var habit = Habit(textController.text, now.toString());
    _model.addHabit(habit); 
    textController.clear();
    notifyListeners();
  }

  List<Habit> getHabitList() {
    return _model.habits;
  }

  
}