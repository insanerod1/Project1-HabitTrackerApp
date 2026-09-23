import 'package:flutter/material.dart';
import 'package:habittracker/Controllers/HabitController.dart';
import 'package:habittracker/Models/HabitSave.dart';
import 'package:habittracker/widgets/datatable.dart';
import 'package:habittracker/Controllers/SaveController.dart';
import 'package:habittracker/screens/saved_files.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final HabitController habitController = HabitController();
  final SaveController saveController = SaveController();
 
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
                saveController.saveHabitList(habitController.getHabitList(), textController.text);
                textController.clear();
                habitController.clearHabits();
                //print(save.toString());
              }, child: Text("Save")),

              const SizedBox(width: 5, height: 10),
              ElevatedButton(
                onPressed: () async {
                  final SaveHabit? selectedSave = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Loadscreen(),
                    ),
                  );

                  if (selectedSave != null) {
                    habitController.replaceHabits(selectedSave.getHabits());
                  }
                },
                child: const Text("Load"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
