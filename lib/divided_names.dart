import 'package:flutter/material.dart';
import 'package:random_creater/save_name.dart';

class DividedNameScreen extends StatelessWidget {
  final List<SaveName>nameList;
  const DividedNameScreen({Key? key, required this.nameList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<SaveName>>dividedGroups= _divideNamesIntoGroups(nameList, 5);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Divided Groups'),
      ),
      body: ListView.builder(
        itemCount: dividedGroups.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Group ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: dividedGroups[index]
                    .map((name) => Text(name.name))
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to divide names into groups
List<List<SaveName>> _divideNamesIntoGroups(List<SaveName> names, int numberOfGroups) {
  List<List<SaveName>> dividedGroups = List.generate(numberOfGroups, (index) => <SaveName>[]);

  for (int i = 0; i < names.length; i++) {
    dividedGroups[i % numberOfGroups].add(names[i]);
  }

  return dividedGroups;
}

}