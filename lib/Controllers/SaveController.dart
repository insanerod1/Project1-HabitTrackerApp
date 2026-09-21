import 'package:habittracker/Models/HabitSave.dart';
import 'package:habittracker/Models/Habits.dart';
import 'package:habittracker/Storage/habit-database.dart';

class SaveController {
  final SavedHabitsDatabase repository;

  List<SaveHabit> _savedHabits = [];

  List<SaveHabit> get savedHabits {
    return List.un
  }  

  List<Habit> _list = [];
  String _title = '';
  DateTime _now = DateTime.now();

  SaveController(this.repository, List<Habit> habits, String title)
  {
    this._list = habits;
    this._title = title;
  }

  @override
  String toString() {
    return _list.toString() + " " + _title + " " + _now.toString();
  }
}