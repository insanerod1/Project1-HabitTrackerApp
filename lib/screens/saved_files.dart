import 'package:flutter/material.dart';
import 'package:habittracker/Controllers/SaveController.dart';
import 'package:habittracker/Models/HabitSave.dart';

class Loadscreen extends StatefulWidget
{
  const Loadscreen({Key? key}) : super(key: key);

  @override 
  State<Loadscreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<Loadscreen>
{
  
  final saveController = SaveController();
  
  Future<void> _loadSavedHabits() async {
  await saveController.loadAllSaves();

  if (mounted) {
    setState(() {});
  }
  }
  @override
  void initState() {
    super.initState();
    _loadSavedHabits();
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loads"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: saveController.savedHabits.length,
          itemBuilder: (context, index) {
            SaveHabit habit = saveController.savedHabits[index];
            return ListTile(
              title: Text('${habit.getTitle()}: ${habit.getDate()}'),
              onTap: () {

              Navigator.pop(
              context,
              habit,
              );


              },
              
            );
          },
        ),
      ),
    );
  }
}