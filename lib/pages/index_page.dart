import 'package:flutter/material.dart';
import 'package:flutter_tasks/pages/Operator.dart';

class TaskPage extends StatelessWidget {
  final List<String> tasks = [
    'Task 1: Data Types',
    'Task 2: Operators Page',
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
              title: Text(
                tasks[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OperatorsPage()),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
