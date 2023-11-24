import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_creater/save_name.dart';

class DividedNameScreen extends StatelessWidget {
  final List<SaveName> nameList;

  const DividedNameScreen({Key? key, required this.nameList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<SaveName>> dividedGroups = _divideNamesIntoGroups(nameList);
   return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Name Groups',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor:const Color.fromARGB(255, 162, 53, 75), 
      ),
      body: Container(
        padding:const EdgeInsets.all(16),
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 183, 58, 58), Color.fromARGB(255, 181, 63, 118)],
          ),
        ),
        child: ListView.builder(
          itemCount: dividedGroups.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white, 
              child: ListTile(
                title: Text(
                  'Group ${index + 1}',
                  style:const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple, 
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: dividedGroups[index]
                      .map((name) => Text(
                            name.name,
                            style:const TextStyle(
                              fontSize: 18,
                              color: Colors.indigo, 
                            ),
                          ))
                      .toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<List<SaveName>> _divideNamesIntoGroups(List<SaveName> names) {
    List<SaveName> shuffledNames = List.from(names)..shuffle();
    int numberOfGroups = (shuffledNames.length / 5).ceil();
    List<List<SaveName>> dividedGroups = List.generate(numberOfGroups, (index) => <SaveName>[]);

    int current = 0;
    for (int i = 0; i < numberOfGroups; i++) {
      int groupSize = min(5, shuffledNames.length - current);
      dividedGroups[i].addAll(shuffledNames.sublist(current, current + groupSize));
      current += groupSize;

      while (dividedGroups[i].length < 5 && current < shuffledNames.length) {
        int randomIndex = Random().nextInt(numberOfGroups);
        dividedGroups[randomIndex].add(shuffledNames[current]);
        current++;
      }
    }

    return dividedGroups;
  }
}