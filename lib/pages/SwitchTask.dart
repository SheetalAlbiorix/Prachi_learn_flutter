import 'package:flutter/material.dart';

class Employee {
  final String firstName;
  final String lastName;
  final String photoUrl;
  final String designation;
  final String location;
  final String email;
  final String mobile;

  Employee({
    required this.firstName,
    required this.lastName,
    required this.photoUrl,
    required this.designation,
    required this.location,
    required this.email,
    required this.mobile,
  });
}

class EmployeeForm extends StatefulWidget {
  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final List<Employee> employees = [
    Employee(
      firstName: 'Allence',
      lastName: 'Vakhariya',
      photoUrl: 'assets/images/allence.jpg',
      designation: 'Flutter Developer',
      location: 'Ahmedabad',
      email: 'allencev.albiorix@gmail.com',
      mobile: '+91-7990116270',
    ),
    Employee(
      firstName: 'Anant',
      lastName: 'Prajapati',
      photoUrl: 'assets/images/Anant.jpeg',
      designation: 'Software Engineer',
      location: 'Ahmedabad',
      email: 'anantp.albiorix@gmail.com',
      mobile: '+91-9428976681',
    ),
    Employee(
      firstName: 'Chirag',
      lastName: 'Gohil',
      photoUrl: 'assets/images/Chirag.jpg',
      designation: 'Trainee Software Engineer',
      location: 'Ahmedabad',
      email: 'chiragg.albiorix@gmail.com',
      mobile: '+91-9978431633',
    ),
    Employee(
      firstName: 'Himanshu',
      lastName: 'Jawale',
      photoUrl: 'assets/images/Himanshu.jpg',
      designation: 'Trainee Software Engineer',
      location: 'Ahmedabad',
      email: 'himanshuj.albiorix@gmail.com',
      mobile: '+91-9714160383',
    ),
    Employee(
      firstName: 'Jhanvi',
      lastName: 'Pathar',
      photoUrl: 'assets/images/Jhanvi.jpg',
      designation: 'Software Engineer',
      location: 'Ahmedabad',
      email: 'jhanvip.albiorix@gmail.com',
      mobile: '+91-9106849593',
    ),
    Employee(
      firstName: 'Khush',
      lastName: 'Pajwani',
      photoUrl: 'assets/images/Khush.jpg',
      designation: 'Software Engineer',
      location: 'Ahmedabad',
      email: 'khushp.albiorix@gmail.com',
      mobile: '+91-9429108545',
    ),
    Employee(
      firstName: 'Krishna',
      lastName: 'Barasara',
      photoUrl: 'assets/images/krishna.jpeg',
      designation: 'Software Engineer',
      location: 'Ahmedabad',
      email: 'krishnab.albiorix@gmail.com',
      mobile: '+91-9879465832',
    ),
    Employee(
      firstName: 'Mileniyam',
      lastName: 'Modi',
      photoUrl: 'assets/images/Mileniyam.jpg',
      designation: 'Flutter Developer',
      location: 'Ahmedabad',
      email: 'milenniyamm.albiorix@gmail.com',
      mobile: '+91-88497968951',
    ),
    Employee(
      firstName: 'Palak',
      lastName: 'Ramani',
      photoUrl: 'assets/images/Palak.jpg',
      designation: 'Software Engineer',
      location: 'Ahmedabad',
      email: 'palakr.albiorix@gmail.com',
      mobile: '+91-8320821187',
    ),
    Employee(
      firstName: 'Prachi',
      lastName: 'Kotak',
      photoUrl: 'assets/images/prachi.jpeg',
      designation: 'Trainee Software Developer  ',
      location: 'Ahmedabad',
      email: 'prachik.albiorix@gmail.com',
      mobile: '+91-7862020227',
    ),
    Employee(
      firstName: 'Raj',
      lastName: 'Shah',
      photoUrl: 'assets/images/Raj.jpg',
      designation: 'Software Engineer',
      location: 'Ahmedabad',
      email: 'rajh.albiorix@gmail.com',
      mobile: '+91-9409136777',
    ),
    Employee(
      firstName: 'Sarvesh',
      lastName: 'Savaliya',
      photoUrl: 'assets/images/Sarvesh.jpg',
      designation: 'Software Engineer',
      location: 'Ahmedabad',
      email: 'sarveshs.albiorix@gmail.com',
      mobile: '+91-9409684668',
    ),
    Employee(
      firstName: 'Sazzadhusen',
      lastName: 'Iproliya',
      photoUrl: 'assets/images/Sazzadhusen.jpg',
      designation: 'Technical Team Lead(Mobile & Web)',
      location: 'Ahmedabad',
      email: 'sazzadhusen.albiorix@gmail.com',
      mobile: '+91-9925342734',
    ),
    Employee(
      firstName: 'Shashank',
      lastName: 'Adhatrao',
      photoUrl: 'assets/images/Shashank.jpg',
      designation: 'Software Engineer',
      location: 'Ahmedabad',
      email: 'shashanka.albiorix@gmail.com',
      mobile: '+91-9104077165',
    ),
    Employee(
      firstName: 'Sheetal',
      lastName: 'Rathod',
      photoUrl: 'assets/images/sheetal mam.jpg',
      designation: 'Project Manager',
      location: 'Ahmedabad',
      email: 'sheetal.albiorix@gmail.com',
      mobile: '+91-9909789956',
    ),
    Employee(
      firstName: 'Sohan',
      lastName: 'Bhadra',
      photoUrl: 'assets/images/Sohan.jpg',
      designation: 'Software Engineer(Android/Flutter)',
      location: 'Ahmedabad',
      email: 'sohanb.albiorix@gmail.com',
      mobile: '+91-9662935949',
    ),
  ];
  Employee? selectedEmployee;

  Widget getEmployeeDetails() {
    switch (selectedEmployee) {
      case null:
        return Text('No employee selected');
      default:
        return EmployeeDetails(employee: selectedEmployee!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: DropdownButton<Employee>(
                hint: Text('Select an Employee'),
                value: selectedEmployee,
                onChanged: (Employee? newValue) {
                  setState(() {
                    selectedEmployee = newValue;
                  });
                },
                items: employees.map((Employee employee) {
                  return DropdownMenuItem<Employee>(
                    value: employee,
                    child: Text('${employee.firstName} ${employee.lastName}'),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            getEmployeeDetails(),
          ],
        ),
      ),
    );
  }
}

class EmployeeDetails extends StatelessWidget {
  final Employee employee;

  const EmployeeDetails({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                backgroundImage: AssetImage(employee.photoUrl),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                '${employee.firstName} ${employee.lastName}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.work, color: Colors.blue.shade200),
              title: Text(
                'Designation',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(employee.designation),
            ),
            ListTile(
              leading: Icon(Icons.location_city, color: Colors.red.shade200),
              title: Text(
                'Location',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(employee.location),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.green.shade200),
              title: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(employee.email),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.orange.shade200),
              title: Text(
                'Mobile',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(employee.mobile),
            ),
          ],
        ),
      ),
    );
  }
}
