import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Employee {
  final int id;
  final String employeeID;
  final String firstName;
  final String lastName;
  final String photoUrl;
  final String designation;
  final String location;
  final String email;
  final String mobile;
  final String? team;

  Employee({
    required this.id,
    required this.employeeID,
    required this.firstName,
    required this.lastName,
    required this.photoUrl,
    required this.designation,
    required this.location,
    required this.email,
    required this.mobile,
    required this.team,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      employeeID: json['employeeID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      photoUrl: json['photoUrl'],
      designation: json['designation'],
      location: json['location'],
      email: json['email'],
      mobile: json['mobile'],
      team: json['team'],
    );
  }
}

Future<List<Employee>> fetchEmployees() async {
  final String response = await rootBundle.loadString('assets/data.json');
  final data = await json.decode(response);
  return (data['data'] as List).map((json) => Employee.fromJson(json)).toList();
}

class MyEmployeeApp extends StatefulWidget {
  @override
  _MyEmployeeAppState createState() => _MyEmployeeAppState();
}

class _MyEmployeeAppState extends State<MyEmployeeApp> {
  late List<Employee> futureEmployees;
  String? selectedTeam;
  List<Employee> employees = [];
  List<Employee> filteredEmployees = [];
  Set<String?> uniqueTeams = {};

  @override
  void initState() {
    super.initState();
    fetchDataFromList();
  }

  Future<void> fetchDataFromList() async {
    futureEmployees = await fetchEmployees();
    setState(() {
      employees = futureEmployees;
      filteredEmployees = futureEmployees;
      uniqueTeams = employees.map((emp) => emp.team).toSet();
    });
  }

  void filterByTeam(String? team) {
    setState(() {
      selectedTeam = team;
      if (team == null || team.isEmpty) {
        filteredEmployees = employees;
      } else {
        filteredEmployees = employees.where((emp) => emp.team == team).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
      ),
      body: employees.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButton<String>(
                    hint: const Text('Select a Team'),
                    value: selectedTeam,
                    onChanged: (String? newValue) {
                      filterByTeam(newValue);
                    },
                    items: uniqueTeams
                        .map((team) => DropdownMenuItem<String>(
                              value: team,
                              child: Text(team ?? 'Team'),
                            ))
                        .toList(),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredEmployees.length,
                    itemBuilder: (context, index) {
                      Employee employee = filteredEmployees[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: CircleAvatar(
                                  radius: 65,
                                  backgroundImage:
                                      AssetImage(employee.photoUrl),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Center(
                                child: Text(
                                  '${employee.firstName} ${employee.lastName}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Divider(),
                              ListTile(
                                leading: Icon(Icons.star,
                                    color: Colors.yellow.shade200),
                                title: const Text(
                                  'EmpID',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(employee.employeeID),
                              ),
                              ListTile(
                                leading: Icon(Icons.work,
                                    color: Colors.blue.shade200),
                                title: const Text(
                                  'Designation',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(employee.designation),
                              ),
                              ListTile(
                                leading: Icon(Icons.location_city,
                                    color: Colors.red.shade200),
                                title: const Text(
                                  'Location',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(employee.location),
                              ),
                              ListTile(
                                leading: Icon(Icons.email,
                                    color: Colors.green.shade200),
                                title: const Text(
                                  'Email',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(employee.email),
                              ),
                              ListTile(
                                leading: Icon(Icons.phone,
                                    color: Colors.orange.shade200),
                                title: const Text(
                                  'Mobile',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(employee.mobile),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
