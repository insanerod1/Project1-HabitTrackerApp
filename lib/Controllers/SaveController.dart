import 'package:habittracker/Models/HabitSave.dart';
import 'package:habittracker/Models/Habits.dart';

class SaveController {
  List<Habit> _list = [];
  String _title = '';
  DateTime _now = DateTime.now();
  SaveController(List<Habit> habits, String title)
  {
    this._list = habits;
    this._title = title;
    SaveHabit save = new SaveHabit(_list, _title, _now.toString(), _now.microsecondsSinceEpoch);
  }


  @override
  String toString() {
    return _list.toString() + " " + _title + " " + _now.toString();
  }

}