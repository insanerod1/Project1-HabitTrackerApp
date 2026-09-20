import 'package:flutter/material.dart';
import 'package:habittracker/Models/Habits.dart';


class SaveHabit
{
  List<Habit> _habitList = [];
  String? _title;
  String? _date;
  int? _id;

  SaveHabit(List<Habit> list, String title, String date, int id)
  {
    this._habitList = list;
    this._title = title;
    this._date = date;
    this._id = id;  
  }

  Map<String, dynamic> toJson() => {
    "id" : _id,
    "title" :  _title,
    "date" : _date,
    "habits" : _habitList.map((habit) => habit.toJson()).toList(),
  };

}