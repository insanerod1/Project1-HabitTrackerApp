import 'package:flutter/material.dart';
import './screens/home.dart';

void main ()
{
  runApp(const HabitApp());
}

class HabitApp extends StatelessWidget{
  const HabitApp({Key? key}) : super(key: key);

  Widget build(BuildContext context){
    return MaterialApp(
      home: const HomeScreen(),
    );
  }
}