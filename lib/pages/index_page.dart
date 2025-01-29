import 'package:flutter/material.dart';
import 'package:flutter_tasks/pages/gridview.dart';

class TaskPage extends StatelessWidget {
  final List<String> tasks = [
    'Task 1: All Data Types',
    'Task 2: Operators Page',
    'Task 3: GridView Task',
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
          return ListTile(
            title: Text(tasks[index]),
            onTap: () {
              if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridViewTask()),
                );
              }
            },
          );
        },
      ),
    );
  }
}
