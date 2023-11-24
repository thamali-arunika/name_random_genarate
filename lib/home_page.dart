import 'package:flutter/material.dart';
import 'package:random_creater/divided_names.dart';
import 'package:random_creater/save_name.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  List<SaveName> names = List.empty(growable: true);
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    debugDisableShadows = false;
   return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              'Group Creator',
              style: TextStyle(
                fontFamily: 'MyFontCaveat',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 4, 152, 148),
              ),
            ),
            const SizedBox(height: 5), // Adjust the spacing as needed
            Text(
              'Names Count: ${names.length}',
              style:const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
          
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextField(
              keyboardType: TextInputType.name,
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: 'Enter Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      if (name.isNotEmpty) {
                        setState(() {
                          names.add(SaveName(name: name));
                          nameController.text = '';
                        });
                      }
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      if (name.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          names[selectedIndex].name = name;
                          selectedIndex = -1;
                        });
                      }
                    },
                    child: const Text('Update')),
                ElevatedButton(
                    onPressed: () {
                      // Open new UI to display divided name groups
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DividedNameScreen(nameList: names),
                        ),
                      );
                    },
                    child: const Text('Divide Groups')),
              ],
            ),
            const SizedBox(height: 50),
            names.isEmpty
                ? const Text(
                    'Not Names Yet ....',
                    style: TextStyle(
                        fontSize: 40,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(255, 168, 3, 55),
                        fontWeight: FontWeight.bold),
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
          backgroundColor: index % 2 == 0
              ? Colors.pink
              : const Color.fromARGB(255, 157, 12, 58),
          foregroundColor: Colors.white,
          child: Text(
            names[index].name[0],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              names[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    nameController.text = names[index].name;
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    setState(() {
                      names.removeAt(index);
                    });
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
