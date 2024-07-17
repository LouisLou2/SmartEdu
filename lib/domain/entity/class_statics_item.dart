class ClassStaticsItem {
  ClassStaticsItem({
    this.classId,
    this.className,
    this.majorName,
    this.campusName,
    this.startYear,
    this.conselorId,
    this.maleNum,
    this.femaleNum,
  });

  ClassStaticsItem.fromJson(dynamic json) {
    classId = json['class_id'];
    className = json['class_name'];
    majorName = json['major_name'];
    campusName = json['campus_name'];
    startYear = json['start_year'];
    conselorId = json['conselor_id'];
    maleNum = json['male_num'];
    femaleNum = json['female_num'];
  }
  num? classId;
  String? className;
  String? majorName;
  String? campusName;
  num? startYear;
  String? conselorId;
  num? maleNum;
  num? femaleNum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['class_id'] = classId;
    map['class_name'] = className;
    map['major_name'] = majorName;
    map['campus_name'] = campusName;
    map['start_year'] = startYear;
    map['conselor_id'] = conselorId;
    map['male_num'] = maleNum;
    map['female_num'] = femaleNum;
    return map;
  }
}
