import 'package:habittracker/Models/HabitSave.dart';
import 'package:habittracker/Models/Habits.dart';
import 'package:habittracker/Storage/habit-database.dart';

class SaveController {
  final SavedHabitsDatabase repository;

  SaveController() : repository = SavedHabitsDatabase.instance;

  List<SaveHabit> _savedHabits = [];

  List<SaveHabit> get savedHabits {
    return List.unmodifiable(_savedHabits);
  }  

  Future<SaveHabit> saveHabitList(List<Habit> habits, String title)
  async {
    final save = SaveHabit(
      List<Habit>.from(habits),
      title,
      DateTime.now().toString(),
    );
      final savedHabit = await repository.create(save);

      _savedHabits.add(savedHabit);

      return savedHabit;
    }



  Future<void> loadAllSaves() async {
    
    _savedHabits = await repository.readAll();
    
  }
  
  Future<SaveHabit> loadOneSave(int id) {
    return repository.readOne(id);
  }
}