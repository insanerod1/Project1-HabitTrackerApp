import 'package:flutter/material.dart';
import 'package:habittracker/Models/Habits.dart';

class HabitTable extends StatelessWidget {
  final List<Habit> habits;

  const HabitTable({required this.habits});

  @override
  build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: const [
          DataColumn(columnWidth: FlexColumnWidth(3), label: Text('Habit')),
          DataColumn(columnWidth: FlexColumnWidth(1), label: Text('Date')),
        ],
        rows: habits.map((habit) {
          return DataRow(
            cells: [
              DataCell(
                Text(
                  habit.getItem(),
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontWeight: FontWeight(30)),
                ),
              ),
              DataCell(
                Text(
                  habit.getData(),
                  overflow: TextOverflow.clip,
                  softWrap: true,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
