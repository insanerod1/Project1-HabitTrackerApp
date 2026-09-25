import 'package:flutter/material.dart';
import 'package:habittracker/Controllers/HabitController.dart';
import 'package:habittracker/Models/HabitSave.dart';
import 'package:habittracker/widgets/datatable.dart';
import 'package:habittracker/Controllers/SaveController.dart';
import 'package:habittracker/screens/saved_files.dart';
import 'package:habittracker/colors/colors.dart';

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

  @override
  void dispose() {
    textController.dispose();
    habitController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),            
          ),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(hintText: "Input Habit Here:"),
            autofocus: true,
          ),
          ),
          backgroundColor: AppColors.cobaltblue,
          toolbarHeight: 100,
      ),
      body: Container(
        child: HabitTable(habits: habitController.getHabitList()),
          ),              
      bottomNavigationBar: SafeArea(                //the bottom of the page
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              const SizedBox(width: 20, height: 10),
              ElevatedButton(onPressed: () {
                if(textController.text.isEmpty || textController.text.contains(';'))
                {
                  habitController.ShowDialog("Make sure the Text Fild has name of Save", context);
                  return;
                }
                saveController.saveHabitList(habitController.getHabitList(), textController.text);
                textController.clear();
                habitController.clearHabits();
                //print(save.toString());
              }, child: Text("Save")),

              const SizedBox(width: 40, height: 10),
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

              const SizedBox(width: 20, height: 15),
              ElevatedButton(
                  onPressed: () {
                    if(textController.text.contains(';') || textController.text.isEmpty)
                    {
                      habitController.ShowDialog("Please enter a valid input (Not empty and No ';')", context);
                      return;
                    }
                    habitController.submitHabit();
                    },
                  child: Icon(Icons.add),
                  style: ButtonStyle(
                    padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.fromLTRB(50,50,50,50),
                    ),
                    backgroundColor: WidgetStatePropertyAll<Color>(AppColors.orange),
                  ),
                ),              
            ],
          ),
          ),
        ),
    );
  }
}
