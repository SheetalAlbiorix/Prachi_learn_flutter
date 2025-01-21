import 'package:flutter/material.dart';
import 'package:flutter_tasks/pages/datatype_task.dart';

class TaskPage extends StatelessWidget {
  final List<String> tasks = [
    'Task 1: All Data Types',
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DataTypeTask()),
              );
            },
          );
        },
      ),
    );
  }
}
