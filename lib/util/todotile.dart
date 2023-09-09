// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? delete;


  ToDoTile({required this.taskName, required this.taskCompleted,required this.onChanged,required this.delete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion:StretchMotion(),
          children:[
            SlidableAction(
              icon:Icons.delete,
              backgroundColor: Colors.red,
              onPressed: delete,
              borderRadius:BorderRadius.circular(12),
            )
          ]
        ),
        child: Container(
          decoration: BoxDecoration(
            color:Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          // ignore: sort_child_properties_last
          child:Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                //C H E C K  B O X
                Checkbox(
                  value:taskCompleted,
                  onChanged:onChanged,
                  activeColor: Colors.black,),
                //T A S K  N A M E
                Text(taskName,style: TextStyle(decoration:taskCompleted?TextDecoration.lineThrough:null),),
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}