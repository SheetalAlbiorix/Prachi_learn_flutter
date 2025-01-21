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

  Map<String, dynamic> studentData = {
    'name': '',
    'age': '',
    'email': '',
    'phone': '',
    'enrolled': false,
  };

  bool submitted = false;

  void submitForm() {
    setState(() {
      studentData['name'] = nameController.text;
      studentData['age'] = ageController.text;
      studentData['email'] = emailController.text;
      studentData['phone'] = phoneController.text;
      submitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Data Types with Map'),
      ),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                    value: studentData['enrolled'],
                    onChanged: (value) {
                      setState(() {
                        studentData['enrolled'] = value;
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
                      Text('Name: ${studentData['name']}',
                          style: TextStyle(fontSize: 16)),
                      Text('Age: ${studentData['age']}',
                          style: TextStyle(fontSize: 16)),
                      Text('Email: ${studentData['email']}',
                          style: TextStyle(fontSize: 16)),
                      Text('Phone: ${studentData['phone']}',
                          style: TextStyle(fontSize: 16)),
                      Text('Enrolled: ${studentData['enrolled']}',
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
