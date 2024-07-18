class Student {
  String picUrl;
  String name;
  bool gender;
  String stuId;
  String phoneNumber;
  int majorId;
  String majorName;
  DateTime birthday;
  String address;
  int schoolId;
  String schoolName;
  int gradeLevel;
  String identity;
  int startYear;

  Student({
    required this.picUrl,
    required this.name,
    required this.gender,
    required this.stuId,
    required this.phoneNumber,
    required this.majorId,
    required this.majorName,
    required this.birthday,
    required this.address,
    required this.schoolId,
    required this.schoolName,
    required this.gradeLevel,
    required this.identity,
    required this.startYear,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      picUrl: json['picUrl'],
      name: json['name'],
      gender: json['gender'],
      stuId: json['stuId'],
      phoneNumber: json['phoneNumber'],
      majorId: json['majorId'],
      majorName: json['majorName'],
      birthday: DateTime.parse(json['birthday']),
      address: json['address'],
      schoolId: json['schoolId'],
      schoolName: json['schoolName'],
      gradeLevel: json['gradeLevel'],
      identity: json['identity'],
      startYear: json['startYear'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'picUrl': picUrl,
      'name': name,
      'gender': gender,
      'stuId': stuId,
      'phoneNumber': phoneNumber,
      'majorId': majorId,
      'majorName': majorName,
      'birthday': birthday.toIso8601String(),
      'address': address,
      'schoolId': schoolId,
      'schoolName': schoolName,
      'gradeLevel': gradeLevel,
      'identity': identity,
    };
  }
  String get gradeLevelStr {
    switch (gradeLevel) {
      case 1:
        return '大一';
      case 2:
        return '大二';
      case 3:
        return '大三';
      case 4:
        return '大四';
      default:
        return '未知';
    }
  }
}