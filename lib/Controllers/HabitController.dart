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

  void clearHabits()
  {
    _model.clearHabits();
    notifyListeners();
  }
  void replaceHabits(List<Habit> habit)
  {
    _model.replaceHabits(habit);
    notifyListeners();
  }

  List<Habit> getHabitList() {
    return _model.habits;
  }

  
}