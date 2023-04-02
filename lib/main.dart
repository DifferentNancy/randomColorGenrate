import 'package:flutter/material.dart';

import 'dart:math' as math;


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _color = Colors.white;

  void changeColor(){
    setState(() {
      _color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Scaffold(
        backgroundColor: _color,
        body: HomeScreen(changeColor: changeColor, color: _color,),)),
    );
  }
}

class HomeScreen extends StatelessWidget {
  VoidCallback? changeColor;
  Color? color;
  HomeScreen({Key? key, this.changeColor, this.color}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: InkWell(
        onTap: changeColor,
        child: Container(
          color: color,
        ),
      ),
    );
  }
}