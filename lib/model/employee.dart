class Datum {
  int? id;
  String? employeeID;
  String? firstName;
  String? lastName;
  String? designation;
  String? location;
  String? photoUrl;
  String? email;
  String? mobile;
  String? hometown;
  String? team;
  List<String>? technologies;

  Datum({
    this.id,
    this.employeeID,
    this.firstName,
    this.lastName,
    this.designation,
    this.location,
    this.photoUrl,
    this.email,
    this.mobile,
    this.hometown,
    this.team,
    this.technologies,
  });

  factory Datum.fromJson(Map<String, dynamic> json, Map<int, String> techMap) {
    return Datum(
      id: json['id'],
      employeeID: json['employeeID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      designation: json['designation'],
      location: json['location'],
      photoUrl: json['photoUrl'],
      email: json['email'],
      mobile: json['mobile'],
      hometown: json['hometown'],
      team: json['team'],
      technologies: (json['technologies'] as List<dynamic>?)
          ?.map(
              (techId) => techMap[int.tryParse(techId.toString())] ?? "Unknown")
          .toList(),
    );
  }
}

class EmployeeData {
  List<Datum>? data;

  EmployeeData({this.data});

  factory EmployeeData.fromJson(
      Map<String, dynamic> json, Map<int, String> techMap) {
    return EmployeeData(
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => Datum.fromJson(item, techMap))
          .toList(),
    );
  }
}
