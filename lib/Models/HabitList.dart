import './Habits.dart';

class HabitData  {
  final List<Habit> _habitList = [];
  
  List<Habit> get habits => List.unmodifiable(_habitList);
  
  void addHabit(Habit habit)
  {
    _habitList.add(habit);

  }
  void removeHabit(Habit habit)
  {
    _habitList.remove(habit);
  }

}