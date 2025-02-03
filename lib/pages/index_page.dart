import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  final List<String> tasks = [
    'Task 1: All Data Types',
    'Task 2: Operators Page',
    'Task 3: GridView Task',
    'Task 4: CarType Task',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks Index'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 4.0,
            child: ListTile(
              title: Text(tasks[index]),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
