class RepairReportReq {
  int? campusId;
  String? building;
  String? classroomName;
  int offset;
  int num;
  RepairReportReq({
    this.campusId,
    this.building,
    this.classroomName,
    required this.offset,
    required this.num,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (campusId != null) map['campusId'] = campusId;
    if (building != null) map['building'] = building;
    if (classroomName != null) map['classroomName'] = classroomName;
    map['offset'] = offset;
    map['num'] = num;
    return map;
  }
}
