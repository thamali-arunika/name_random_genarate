import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Group Creater',
          style: TextStyle(
            fontSize:30,
            fontWeight: FontWeight.bold,
          color:Color.fromARGB(255, 4, 152, 148)), 
          ),
        ),
      );
  }
}