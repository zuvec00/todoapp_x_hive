import 'package:flutter/material.dart';
import 'package:recipe_list/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({required this.controller,required this.onSave,required this.onCancel});


  void onPressed(){

  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content:Container(
        height: 120,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          // ignore: prefer_const_constructors
          TextField(
            controller : controller,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Add a new task',
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            //save
            MyButton(name: 'Save', onPressed: onSave),
            MyButton(name: 'Cancel', onPressed: onCancel),
            //cancel
          ])
        ],)
      )
    );
  }
}