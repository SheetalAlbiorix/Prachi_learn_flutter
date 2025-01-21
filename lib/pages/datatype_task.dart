import 'package:flutter/material.dart';

class DataTypeTask extends StatefulWidget {
  @override
  _DataTypeTaskState createState() => _DataTypeTaskState();
}

class _DataTypeTaskState extends State<DataTypeTask> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool enrolled = false;
  bool submitted = false;

  void submitForm() {
    setState(() {
      submitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Data Types'),
      ),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(' \u2665 Student Information:',
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 15.0),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Enter Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'Enter Age',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Enter Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: [
                  Text('Enrolled: ', style: TextStyle(fontSize: 16)),
                  Switch(
                    value: enrolled,
                    onChanged: (value) {
                      setState(() {
                        enrolled = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
              ),
              if (submitted)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${nameController.text}',
                          style: TextStyle(fontSize: 16)),
                      Text('Age: ${ageController.text}',
                          style: TextStyle(fontSize: 16)),
                      Text('Email: ${emailController.text}',
                          style: TextStyle(fontSize: 16)),
                      Text('Phone: ${phoneController.text}',
                          style: TextStyle(fontSize: 16)),
                      Text('Enrolled: $enrolled',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
