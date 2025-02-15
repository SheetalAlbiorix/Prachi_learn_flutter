class Technology {
  int? technologyId;
  String? name;

  Technology({
    this.technologyId,
    this.name,
  });

  factory Technology.fromJson(Map<String, dynamic> json) {
    return Technology(
      technologyId: json['technologyId'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'technologyId': technologyId,
      'name': name,
    };
  }
}
