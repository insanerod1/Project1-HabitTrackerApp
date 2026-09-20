import 'package:flutter/material.dart';
import 'package:habittracker/Controllers/HabitController.dart';
import 'package:habittracker/widgets/datatable.dart';
import 'package:habittracker/Controllers/SaveController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final HabitController habitController = HabitController();
 
  @override
  void initState() {  //this guy is the function that changes the state of the homepage
    super.initState();
    habitController.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: HabitTable(habits: habitController.getHabitList()),
          ),   
          
        
      
      bottomNavigationBar: SafeArea(                //the bottom of the page
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Expanded(
                child: Container(child: TextField(controller: textController)),
              ),

              const SizedBox(width: 5, height: 10),
              ElevatedButton(
                onPressed: habitController.submitHabit,
                child: Text("ADD"),
              ),

              const SizedBox(width: 5, height: 10),
              ElevatedButton(onPressed: () {
                if(textController.text.isEmpty)
                {
                  return;
                }
                SaveController save = SaveController(habitController.getHabitList(), textController.text);
                //print(save.toString());
              }, child: Text("Save")),

              const SizedBox(width: 5, height: 10),
              ElevatedButton(onPressed: () {}, child: Text("Load")),
            ],
          ),
        ),
      ),
    );
  }
}
