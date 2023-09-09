import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_list/database/database.dart';

import '../util/diaolg_box.dart';
import '../util/todotile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void initState() {
        //if this is the first time ever opening this app
        if(_myBox.get('TODOLIST')==null){
          db.createInitialData();
        }
        else{
          db.loadData();
        }
    super.initState();
  }

  //reference the hive box
  final _myBox = Hive.box('myBox');

  //controller
  final _controller = TextEditingController();

  //onSave
  void saveNewTask(){
    setState((){
      db.toDoList.add([_controller.text,false]);
      _controller.clear;
    });
    db.updateDatabase();
    Navigator.pop(context);
  }
  //cancel 

  void cancel(){
    Navigator.pop(context);
  }
  //list of todo task
 ToDoDatabase db = ToDoDatabase();
    
    //box was tapped

    void onChanged(bool? value,int index){
      setState((){
        db.toDoList[index][1]= !db.toDoList[index][1];
      });
      db.updateDatabase();
    
    }
    //create new task
    void createNewTask(){
      showDialog(context: context, builder: (context){
        return DialogBox(controller:_controller, onSave:saveNewTask,onCancel:cancel);
      });
    }

    //delte
    delete(index){
      setState((){
        db.toDoList.removeAt(index);
      });
      db.updateDatabase();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title:Text('T0 D0',style:GoogleFonts.dosis(fontWeight: FontWeight.bold)),
        
      ),
      floatingActionButton: FloatingActionButton(child:
        Icon(Icons.add),
        onPressed: createNewTask,
        ),
      body:ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted:db.toDoList[index][1],
            onChanged:(value){
            onChanged(value,index);
          } ,
            delete: (context) => delete(index),
            );
        },
      ),

    );
  }
}