import 'package:flutter/material.dart';
import 'package:list/home.dart';
import 'package:list/screens/home_screen.dart';
import 'package:list/screens/onboard/onboard.dart';

void main(){
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Onboard(),
      home: HomePage(),
    );
  }
}


