class ExamTask {
  int courseInstId;
  String courseName;
  DateTime time;
  int seatNumber;
  String atn;
  String assessMethod;
  String building;
  String classroomName;

  ExamTask({
    required this.courseInstId,
    required this.courseName,
    required this.time,
    required this.classroomName,
    required this.seatNumber,
    required this.atn,
    required this.assessMethod,
    required this.building,
  });

  factory ExamTask.fromJson(Map<String, dynamic> json) {
    return ExamTask(
      courseInstId: json['courseInstId'],
      courseName: json['courseName'],
      time: DateTime.parse(json['time']),
      classroomName: json['classroomName'],
      seatNumber: json['seatNumber'],
      atn: json['atn'],
      assessMethod: json['assessMethod'],
      building: json['building'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseInstId': courseInstId,
      'courseName': courseName,
      'time': time.toIso8601String(),
      'classroomName': classroomName,
      'seatNumber': seatNumber,
      'atn': atn,
      'assessMethod': assessMethod,
      'building': building,
    };
  }
}