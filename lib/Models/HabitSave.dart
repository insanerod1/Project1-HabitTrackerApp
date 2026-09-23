//import 'package:flutter/material.dart';
import 'package:habittracker/Models/Habits.dart';

final String savedListTable = "saved_lists";

class TableFields
{
  static final String id = '_id';
  static final String title = 'title';
  static final String date = 'date';
  static final String list = 'list';
}
class SaveHabit
{
  List<Habit> _habitList = [];
  String? _title;
  String? _date;
  int? _id;

  SaveHabit(List<Habit> list, String? title, String? date, [int? id])
  {
    this._habitList = list;
    this._title = title;
    this._date = date;  
    this._id = id;
  }

  String getDate()
  {
    return _date ?? '';
  }

  String getTitle()
  {
    return _title ?? '';
  }

  List<Habit> getHabits()
  {
    return _habitList;
  }

  void setList(List<Habit> habits)
  {
    _habitList = habits;
  }

  void setTitle(String? title)
  {
    _title = title;
  }

  void setDate(String date)
  {
    _date = date;
  }

  SaveHabit copy({
    List<Habit>? list,
    String? title,
    String? date,
    int? id,
  }) => SaveHabit(
        list ?? _habitList,
        title ?? _title ?? '',
        date ?? _date ?? '',
        id ?? _id,
      );

  Map<String, dynamic> toJson() => {
    "id" : _id,
    "title" :  _title,
    "date" : _date,
    //"habits" : _habitList.map((habit) => habit.toJson()).toList(),
  };

 

  factory SaveHabit.fromJson(Map<String, dynamic> json)
  {
    var list = json['habits'] as List<dynamic>;

    List<Habit> habitList = list
        .map((item) => Habit.fromJson(item as Map<String, dynamic>))
        .toList();

    return SaveHabit(
      habitList,
      json['title'] as String,
      json['date'] as String,
      json['id'] as int,
    );
  }
}