import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_tasks/model/employee.dart';

class MyEmployeeApp extends StatefulWidget {
  @override
  _EmployeeAppState createState() => _EmployeeAppState();
}

class _EmployeeAppState extends State<MyEmployeeApp> {
  List<Datum> _employees = [];
  List<Datum> _filteredEmployees = [];
  String _searchKeyword = "";
  String _selectedFilter = "id";
  List<String> _technologyList = [];
  List<String> _designationList = [];
  List<String> _hometownList = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String techData = await rootBundle.loadString('assets/technology.json');
    List<dynamic> techList = json.decode(techData);

    Map<int, String> techMap = {
      for (var tech in techList) tech['technologyId']: tech['name']
    };

    _technologyList = techList.map((tech) => tech['name'] as String).toList();

    String empData = await rootBundle.loadString('assets/data.json');
    final jsonResult = json.decode(empData);
    EmployeeData employeeData = EmployeeData.fromJson(jsonResult, techMap);

    setState(() {
      _employees = employeeData.data ?? [];
      _filteredEmployees = _employees;

      //designation list
      _designationList = _employees
          .map((e) => e.designation ?? "")
          .where((_designation) => _designation.isNotEmpty)
          .toSet()
          .toList();

      //hometown
      _hometownList = _employees
          .map((e) => e.hometown ?? "")
          .where((_hometown) => _hometown.isNotEmpty)
          .toSet()
          .toList();
    });
  }

  void _filterEmployees() {
    setState(() {
      _filteredEmployees = _employees.where((employee) {
        switch (_selectedFilter) {
          case "id":
            return employee.id != null &&
                employee.id.toString().contains(_searchKeyword);
          case "name":
            return ("${employee.firstName ?? ''} ${employee.lastName ?? ''}")
                .toLowerCase()
                .contains(_searchKeyword.toLowerCase());
          case "technology":
            return employee.technologies != null &&
                employee.technologies!.any((tech) =>
                    tech.toLowerCase() == _searchKeyword.toLowerCase());
          case "designation":
            return (employee.designation ?? "")
                .toLowerCase()
                .contains(_searchKeyword.toLowerCase());
          case "hometown":
            return (employee.hometown ?? "")
                .toLowerCase()
                .contains(_searchKeyword.toLowerCase());
          case "mobile":
            return (employee.mobile ?? "")
                .toLowerCase()
                .contains(_searchKeyword.toLowerCase());
          default:
            return true;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    DropdownButton<String>(
                      value: _selectedFilter,
                      items: [
                        "id",
                        "name",
                        "technology",
                        "designation",
                        "hometown",
                        "mobile"
                      ]
                          .map((filter) => DropdownMenuItem(
                                child: Text(filter.toUpperCase()),
                                value: filter,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedFilter = value!;
                          _searchKeyword = "";
                        });
                      },
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: _selectedFilter == "technology"
                          ? DropdownButton<String>(
                              value: _searchKeyword.isNotEmpty
                                  ? _searchKeyword
                                  : null,
                              hint: Text("Select Technology"),
                              isExpanded: true,
                              items: _technologyList
                                  .map((tech) => DropdownMenuItem(
                                        child: Text(tech),
                                        value: tech,
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _searchKeyword = value!;
                                });
                              },
                            )
                          : _selectedFilter == "designation"
                              ? DropdownButton<String>(
                                  value: _searchKeyword.isNotEmpty
                                      ? _searchKeyword
                                      : null,
                                  hint: Text("Select Designation"),
                                  isExpanded: true,
                                  items: _designationList
                                      .map((designation) => DropdownMenuItem(
                                            child: Text(designation),
                                            value: designation,
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _searchKeyword = value!;
                                    });
                                  },
                                )
                              : _selectedFilter == "hometown"
                                  ? DropdownButton<String>(
                                      value: _searchKeyword.isNotEmpty
                                          ? _searchKeyword
                                          : null,
                                      hint: Text("Select Hometown"),
                                      isExpanded: true,
                                      items: _hometownList
                                          .map((hometown) => DropdownMenuItem(
                                                child: Text(hometown),
                                                value: hometown,
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _searchKeyword = value!;
                                        });
                                      },
                                    )
                                  : TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          _searchKeyword = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        labelText: "Search",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _filterEmployees,
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredEmployees.length,
              itemBuilder: (context, index) {
                final employee = _filteredEmployees[index];
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
                            backgroundImage: AssetImage(employee.photoUrl ??
                                'assets/default_avatar.png'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            '${employee.firstName} ${employee.lastName}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: Icon(Icons.star_border_purple500,
                              color: Colors.redAccent.shade200),
                          title: Text(employee.id.toString()),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.star, color: Colors.yellow.shade300),
                          title: Text(employee.employeeID ?? ""),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.work, color: Colors.blue.shade300),
                          title: Text(employee.designation ?? ""),
                        ),
                        ListTile(
                          leading: Icon(Icons.location_city,
                              color: Colors.red.shade300),
                          title: Text(employee.location ?? ""),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.email, color: Colors.green.shade300),
                          title: Text(employee.email ?? ""),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.phone, color: Colors.orange.shade300),
                          title: Text(employee.mobile ?? ""),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.home, color: Colors.pink.shade300),
                          title: Text(employee.hometown ?? "N/A"),
                        ),
                        ListTile(
                          leading: Icon(Icons.code,
                              color: Color.fromARGB(255, 140, 110, 159)),
                          title:
                              Text(employee.technologies?.join(", ") ?? 'N/A'),
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
