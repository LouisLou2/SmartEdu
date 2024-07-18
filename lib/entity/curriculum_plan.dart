class CurriculumPlan {
  String majorName;
  DateTime time;
  int aaoOfficeId;
  String aaoOfficeName;
  int schoolId;
  String schoolName;
  String degreeName;
  int duration;
  int maxDuration;
  int minDuration;
  String desc;
  String target;
  String req;
  List<String> coreCourseIds;
  List<String> coreCourseNames;
  List<String> creditReqNames;
  List<int> creditReqTotals;

  CurriculumPlan({
    required this.majorName,
    required this.time,
    required this.aaoOfficeId,
    required this.aaoOfficeName,
    required this.schoolId,
    required this.schoolName,
    required this.degreeName,
    required this.duration,
    required this.maxDuration,
    required this.minDuration,
    required this.desc,
    required this.target,
    required this.req,
    required this.coreCourseIds,
    required this.coreCourseNames,
    required this.creditReqNames,
    required this.creditReqTotals,
  });

  factory CurriculumPlan.fromJson(Map<String, dynamic> json) {
    return CurriculumPlan(
      majorName: json['majorName'],
      time: DateTime.parse(json['time']),
      aaoOfficeId: json['aaoOfficeId'],
      aaoOfficeName: json['aaoOfficeName'],
      schoolId: json['schoolId'],
      schoolName: json['schoolName'],
      degreeName: json['degreeName'],
      duration: json['duration'],
      maxDuration: json['maxDuration'],
      minDuration: json['minDuration'],
      desc: json['description'],
      target: json['target'],
      req: json['req'],
      coreCourseIds: List<String>.from(json['coreCourseIds']),
      coreCourseNames: List<String>.from(json['courseNames']),
      creditReqNames: List<String>.from(json['creditReqNames']),
      creditReqTotals: List<int>.from(json['creditReqTotals']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'majorName': majorName,
      'time': time,
      'aaoOfficeId': aaoOfficeId,
      'aaoOfficeName': aaoOfficeName,
      'schoolId': schoolId,
      'schoolName': schoolName,
      'degreeName': degreeName,
      'duration': duration,
      'maxDuration': maxDuration,
      'minDuration': minDuration,
      'desc': desc,
      'target': target,
      'req': req,
      'coreCourseIds': coreCourseIds,
      'coreCourseNames': coreCourseNames,
      'creditReqNames': creditReqNames,
      'creditReqTotals': creditReqTotals,
    };
  }
}