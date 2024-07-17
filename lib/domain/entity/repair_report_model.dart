/// reports : [{"report_id":11,"report_time":"2024-12-1","campus_name":"铁道校区","campus_id":4,"building":"世纪楼","classroom_id":10,"classroom_name":"A404","fault_desc":"窗户损坏","status":1,"maint_from":"2024-12-3","maint_to":"2024-12-5","maint_detail":"已经修复完毕"}]
/// sum : 10

class Report {
  Report({
    this.reportId,
    this.reportTime,
    this.campusName,
    this.campusId,
    this.building,
    this.classroomId,
    this.classroomName,
    this.faultDesc,
    this.status,
  });

  Report.fromJson(dynamic json) {
    reportId = json['reportId'];
    reportTime = json['reportTime'];
    campusName = json['campusName'];
    campusId = json['campusId'];
    building = json['building'];
    classroomId = json['classroomId'];
    classroomName = json['classroomName'];
    faultDesc = json['faultDesc'];
    status = json['status']==0?"已维修":"未维修";
  }
  num? reportId;
  String? reportTime;
  String? campusName;
  num? campusId;
  String? building;
  num? classroomId;
  String? classroomName;
  String? faultDesc;
  String? status;
  num? get reportIdValue => reportId;
  String? get reportTimeValue => reportTime;
  String? get campusNameValue => campusName;
  num? get campusIdValue => campusId;
  String? get buildingValue => building;
  num? get classroomIdValue => classroomId;
  String? get classroomNameValue => classroomName;
  String? get faultDescValue => faultDesc;
  String? get statusValue => status;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['report_id'] = reportId;
    map['report_time'] = reportTime;
    map['campus_name'] = campusName;
    map['campus_id'] = campusId;
    map['building'] = building;
    map['classroom_id'] = classroomId;
    map['classroom_name'] = classroomName;
    map['fault_desc'] = faultDesc;
    map['status'] = status;
    return map;
  }
}
