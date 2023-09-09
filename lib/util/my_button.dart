import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  VoidCallback onPressed;

  MyButton({required this.name, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:8.0),
      child: MaterialButton(
        color: Theme.of(context).primaryColor,
        child: Text(name),
        onPressed:onPressed),
    );
  }
}