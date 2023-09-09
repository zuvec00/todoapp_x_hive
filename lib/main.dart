import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_list/pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{

  //init the hive
  await Hive.initFlutter();

  //open a box

  var box = await Hive.openBox('myBox');

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(primarySwatch:Colors.yellow,textTheme:TextTheme(bodyText2: GoogleFonts.dosis())),
      home:HomePage(),
    );
  }
}

