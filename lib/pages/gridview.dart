import 'package:flutter/material.dart';

class GridViewTask extends StatelessWidget {
  const GridViewTask({Key? key}) : super(key: key);

  final List<Map<String, String>> functions = const [
    {
      'label': 'abs',
      'description': 'Returns the absolute value of the number.',
      'input': '-5',
      'implementation':
          'int number = -5;\nint result = number.abs();\nprint(result);\n// Output: 5',
      'output': '5',
    },
    {
      'label': 'ceil',
      'description':
          'Returns the smallest integer greater than or equal to the number.',
      'input': '4.2',
      'implementation':
          'double number = 4.2;\nint result = number.ceil();\nprint(result);\n// Output: 5',
      'output': '5',
    },
    {
      'label': 'floor',
      'description':
          'Returns the largest integer less than or equal to the number.',
      'input': '4.8',
      'implementation':
          'double number = 4.8;\nint result = number.floor();\nprint(result);\n// Output: 4',
      'output': '4',
    },
    {
      'label': 'compareTo',
      'description':
          'Compares this number to another number and returns 0, -1, or 1.',
      'input': 'a = 10, b = 20',
      'implementation':
          'int a = 10, b = 20;\nprint(a.compareTo(b)); // Output: -1\nprint(b.compareTo(a)); // Output: 1\nprint(a.compareTo(10)); // Output: 0',
      'output': '-1, 1, 0',
    },
    {
      'label': 'remainder',
      'description':
          'Returns the remainder of dividing this number by another.',
      'input': '10 % 3',
      'implementation':
          'int number = 10;\nint result = number.remainder(3);\nprint(result);\n// Output: 1',
      'output': '1',
    },
    {
      'label': 'round',
      'description': 'Rounds this number to the nearest integer.',
      'input': '3.5',
      'implementation':
          'double number = 3.5;\nint result = number.round();\nprint(result);\n// Output: 4',
      'output': '4',
    },
    {
      'label': 'toDouble',
      'description': 'Converts this number to a double.',
      'input': '42',
      'implementation':
          'int number = 42;\ndouble result = number.toDouble();\nprint(result);\n// Output: 42.0',
      'output': '42.0',
    },
    {
      'label': 'toInt',
      'description': 'Converts this number to an integer.',
      'input': '45.5',
      'implementation':
          'double number = 45.5;\nint result = number.toInt();\nprint(result);\n// Output: 45',
      'output': '45',
    },
    {
      'label': 'toString',
      'description': 'Converts this number to a string.',
      'input': '42',
      'implementation':
          'int number = 42;\nString result = number.toString();\nprint(result);\n// Output: "42"',
      'output': '"42"',
    },
    {
      'label': 'truncate',
      'description':
          'Truncates this number to an integer by removing fractional digits.',
      'input': '45.5',
      'implementation':
          'double number = 45.5;\nint result = number.truncate();\nprint(result);\n// Output: 45',
      'output': '45',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: functions.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      label: functions[index]['label']!,
                      description: functions[index]['description']!,
                      input: functions[index]['input']!,
                      output: functions[index]['output']!,
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.red.shade100,
                alignment: Alignment.center,
                child: Text(
                  functions[index]['label']!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String label;
  final String description;
  final String input;
  final String output;

  const ResultScreen({
    Key? key,
    required this.label,
    required this.description,
    required this.input,
    required this.output,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              const Text('Input:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(
                input,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              const Text('Output:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(
                output,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
