class StuSearchReq {
  int? schoolId;
  int? majorId;
  int? startYear;
  String? name;
  bool? gender;
  int? classId;
  int offset;
  int num;

  StuSearchReq({
    this.schoolId,
    this.majorId,
    this.startYear,
    this.name,
    this.gender,
    this.classId,
    required this.offset,
    required this.num,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (schoolId != null) data['schoolId'] = schoolId;
    if (majorId != null) data['majorId'] = majorId;
    if (startYear != null) data['title'] = startYear;
    if (name != null) data['name'] = name;
    if (gender != null) data['gender'] = gender;
    if (classId != null) data['classId'] = classId;
    data['offset'] = offset;
    data['num'] = num;

    return data;
  }
}
