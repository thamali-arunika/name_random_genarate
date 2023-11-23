import 'package:flutter/material.dart';
import 'package:random_creater/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Creater',
      theme: ThemeData(
        
      ),
      home: const MyHomePage(),
    );
  }
}

