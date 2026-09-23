//import 'package:flutter/material.dart';
import 'package:habittracker/Models/HabitSave.dart';
import 'package:habittracker/Models/Habits.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class SavedHabitsDatabase {
  static final SavedHabitsDatabase instance = SavedHabitsDatabase._init(); //creates an instance

  static Database? _database; 

  SavedHabitsDatabase._init();

  //Open database
  Future<Database> get database async {
    if (_database != null) return _database!; // check if the database exists

    _database = await _initDB("notes.db");  //creates new file and later where it will be stored
    return _database!; //return for later use
  }
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath(); //store in file storage
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate:_createDB, onOpen:(db) async {
      print('Database Opened successfully');
    },); //takes the path, a version, and your DB skimmer
  } 

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = "TEXT NOT NULL";
    final intType = "INTEGER NOT NULL";


    await db.execute(''' 
    CREATE TABLE $savedListTable (
    ${TableFields.id} $idType,
    ${TableFields.title} $textType,
    ${TableFields.date} $textType
    )
    ''');

    await db.execute(''' 
    CREATE TABLE $habitsTable (
    ${HabitFields.item} $textType,
    ${HabitFields.date} $textType,
    ${HabitFields.saveId} $intType,

    FOREIGN KEY (${HabitFields.saveId})
      REFERENCES $savedListTable (${TableFields.id})
      ON DELETE CASCADE
    )
    ''');
  }
  Future<SaveHabit> create(SaveHabit savehabit) async {
    final db = await instance.database;

    return await db.transaction((transaction) async {
      final saveId = await transaction.insert(
      savedListTable, {
        'title': savehabit.getTitle(),
        'date': savehabit.getDate(),
      }
      );
      for(final habit in savehabit.getHabits()) {
        await transaction.insert(
          habitsTable,
          {
            'item': habit.getItem(),
            'date' : habit.getData(),
            'saveId' : saveId,
          }
        );
      }
      return SaveHabit(
        savehabit.getHabits(),
        savehabit.getTitle(),
        savehabit.getDate(),
        saveId,
      );
    });
  }

  Future<List<SaveHabit>> readAll() async {
      final db = await instance.database;

      final savedListRows = await db.query(savedListTable);

      final savedHabits = <SaveHabit>[];

      for (final savedListRow in savedListRows) {
        final saveId = savedListRow[TableFields.id] as int;

        final habitRows = await db.query(
          habitsTable,
          where: '${HabitFields.saveId} = ?',
          whereArgs: [saveId],
          );

        final habits = habitRows.map((row) {
          return Habit(
            row[HabitFields.item] as String,
            row[HabitFields.date] as String,
          );
        }).toList();

        final savedHabit = SaveHabit(
          habits,
          savedListRow[TableFields.title] as String,
          savedListRow[TableFields.date] as String,
          saveId,
          );

          savedHabits.add(savedHabit);        
      }

      return savedHabits;
  }

  Future<SaveHabit> readOne(int id) async{
    final db = await instance.database;

    final savedRows = await db.query(
      savedListTable,
      where: '${TableFields.id} = ?',
      whereArgs: [id],
      limit: 1,
    );

    final savedRow = savedRows.first;

    final habitRows = await db.query(
      habitsTable,
      where: '${HabitFields.saveId} = ?',
      whereArgs: [id],
      );

    final habits = habitRows.map((row) {
      return Habit(
        row[HabitFields.item] as String,
        row[HabitFields.date] as String,
      );
    }).toList();

    return SaveHabit(
      habits,
      savedRow[TableFields.title] as String,
      savedRow[TableFields.date] as String,
      savedRow[TableFields.id] as int,
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}