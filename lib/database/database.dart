import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoList =[];

  // reference our box

  final _myBox = Hive.box('myBox');

  //run this method if this is the 1st time ever opening this app
  void createInitialData(){
    toDoList= [
      ['Make Tutorial',false],
      ['Do Exercise',false]
    ];
  }
  //load the data form the database
  void loadData(){
    toDoList = _myBox.get('TODOLIST');
  }

  //update the database
  void updateDatabase(){
    _myBox.put('TOD0LIST',toDoList);
  }

}