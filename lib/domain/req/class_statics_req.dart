class ClassStaticsReq {
  int? schoolId;
  int? majorId;
  int? startYear;

  int offset;
  int num;
  ClassStaticsReq({
    this.schoolId,
    this.majorId,
    this.startYear,
    required this.offset,
    required this.num,
  });

  Map<String, dynamic> toJson() {
    //命名方式？驼峰？下划线？
    final map = <String, dynamic>{};
    if (schoolId != null) map['schoolId'] = schoolId;
    if (majorId != null) map['majorId'] = majorId;
    if (startYear != null) map['startYear'] = startYear;
    map['offset'] = offset;
    map['num'] = num;
    return map;
  }
}
