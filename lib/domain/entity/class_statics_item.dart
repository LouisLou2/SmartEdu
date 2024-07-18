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
    classId = json['classId'];
    className = json['className'];
    majorName = json['majorName'];
    campusName = json['campusName'];
    startYear = json['startYear'];
    conselorId = json['counselorId'];
    maleNum = json['maleNum'];
    femaleNum = json['femaleNum'];
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
