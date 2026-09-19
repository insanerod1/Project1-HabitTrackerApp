import 'package:flutter/material.dart';
import 'package:habittracker/Models/Habits.dart';

class HabitTable extends StatelessWidget {
  
  final List<Habit> habits;

  const HabitTable({required this.habits,});
  

  @override build(BuildContext context)
  {
    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Habit')),
          DataColumn(label: Text('Date')),
        ], 
        rows: habits.map((habit) {
          return DataRow(
            cells: [
              DataCell(Text(habit.getItem())),
              DataCell(Text(habit.getData())),
            ]
          );
        }).toList(),
         ),
    );
  }
}