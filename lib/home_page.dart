import 'package:flutter/material.dart';
import 'package:random_creater/save_name.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SaveName> names = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    debugDisableShadows = false;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Group Creater',
            style: TextStyle(
                fontFamily: 'MyFontCaveat',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 4, 152, 148)),
          )),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
         const   SizedBox(height: 30),
          const  TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: 'Enter Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
           const  SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: null, child: Text('Save')),
                ElevatedButton(onPressed: null, child: Text('Update')),
              ],
            ),
          ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) => getRow(),
             )
          ],
        ),
      ),
    );
  }
}
