import 'package:habittracker/Models/HabitSave.dart';
import 'package:habittracker/Models/Habits.dart';
import 'package:habittracker/Storage/save-repository.dart';

class SaveController {
  List<Habit> _list = [];
  String _title = '';
  DateTime _now = DateTime.now();
  int _id = DateTime.now().microsecondsSinceEpoch;
  SaveHabit? save;
  SaveController(List<Habit> habits, String title)
  {
    this._list = habits;
    this._title = title;

    save = new SaveHabit(_list, _title, _now.toString(), _id);
    saveSnapshot(save!);
  }



  @override
  String toString() {
    return _list.toString() + " " + _title + " " + _now.toString();
  }

}