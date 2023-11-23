import 'package:flutter/material.dart';
import 'package:random_creater/save_name.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    TextEditingController nameController = TextEditingController();
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
        padding:const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
             TextField(
              keyboardType: TextInputType.name,
              controller: nameController,
              decoration:const InputDecoration(
                  hintText: 'Enter Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(height: 30),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    String name=nameController.text.trim();
                    if (name.isNotEmpty){
                      setState(() {
                        names.add(SaveName(name: name));
                      
                      });
                    }
                  },
                  child:const Text('Save')),

                ElevatedButton(
                   onPressed: (){
                    String name=nameController.text.trim();
                    if (name.isNotEmpty){
                      setState(() {
                        nameController.text='';
                        names.add(SaveName(name: name));
                      });
                    }
                  },
                child:const Text('Update')),
              ],
            ),
           const SizedBox(height: 50),
            names.isEmpty
                ? const Text(
                    'Not Names Yet ....',
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'MyFontCaveat',
                      color:Color.fromARGB(255, 168, 3, 55),
                      fontWeight: FontWeight.bold
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: names.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: index%2==0 ? Colors.pink :const Color.fromARGB(255, 157, 12, 58),
          foregroundColor: Colors.white,
          child: Text(names[index].name[0],
          style:const TextStyle(
           fontWeight: FontWeight.bold,
          ),
          ),
        ),
        title: Column(
          children: [
            Text(names[index].name),
          ],
        ),
        trailing:const SizedBox(
          width: 70,
          child: Row(
            children: [
              Icon(Icons.edit),
              Icon(Icons.delete),
            ],
          ),
        ) ,
      ),
    );
  }
}
