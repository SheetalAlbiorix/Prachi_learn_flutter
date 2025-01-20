import 'package:flutter/material.dart';

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
            },
          );
        },
      ),
    );
  }
}
