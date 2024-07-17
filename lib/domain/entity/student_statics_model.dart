class StudentStaticsItem {
  StudentStaticsItem({
    this.picUrl,
    this.name,
    this.gender,
    this.stuId,
    this.phoneNumber,
    this.majorId,
    this.majorName,
    this.birthday,
    this.address,
    this.schoolId,
    this.schoolName,
    this.gradeLevel,
    this.indentity,
  });

  StudentStaticsItem.fromJson(dynamic json) {
    picUrl = json['pic_url'];
    name = json['name'];
    gender = json['gender'] ? "男" : "女";
    stuId = json['stu_id'];
    phoneNumber = json['phone_number'];
    majorId = json['major_id'];
    majorName = json['major_name'];
    birthday = json['birthday'];
    address = json['address'];
    schoolId = json['school_id'];
    schoolName = json['school_name'];
    gradeLevel = json['grade_level'];
    indentity = json['indentity'];
  }
  String? picUrl;
  String? name;
  String? gender;
  String? stuId;
  String? phoneNumber;
  num? majorId;
  String? majorName;
  String? birthday;
  String? address;
  num? schoolId;
  String? schoolName;
  num? gradeLevel;
  String? indentity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pic_url'] = picUrl;
    map['name'] = name;
    map['gender'] = gender;
    map['stu_id'] = stuId;
    map['phone_number'] = phoneNumber;
    map['major_id'] = majorId;
    map['major_name'] = majorName;
    map['birthday'] = birthday;
    map['address'] = address;
    map['school_id'] = schoolId;
    map['school_name'] = schoolName;
    map['grade_level'] = gradeLevel;
    map['indentity'] = indentity;
    return map;
  }
}
