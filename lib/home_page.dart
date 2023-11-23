import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    debugDisableShadows=false;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text(
          'Group Creater',
          style: TextStyle(
            fontFamily: 'MyFontCaveat',
            fontSize:30,
            fontWeight: FontWeight.bold,
          color:Color.fromARGB(255, 4, 152, 148)), 
          )),
        
      );
  }
}