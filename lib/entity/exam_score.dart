class ExamScore {
  int year;
  bool termPart;
  int courseInstId;
  String courseName;
  int score;
  int credit;
  String courseType;
  String courseCate;

  ExamScore({
    required this.year,
    required this.termPart,
    required this.courseInstId,
    required this.courseName,
    required this.score,
    required this.credit,
    required this.courseType,
    required this.courseCate,
  });

  factory ExamScore.fromJson(Map<String, dynamic> json) {
    return ExamScore(
      year: json['year'],
      termPart: json['termPart'],
      courseInstId: json['courseInstId'],
      courseName: json['courseName'],
      score: json['score'],
      credit: json['credit'],
      courseType: json['courseType'],
      courseCate: json['courseCate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'termPart': termPart,
      'courseInstId': courseInstId,
      'courseName': courseName,
      'score': score,
      'credit': credit,
      'courseType': courseType,
      'courseCate': courseCate,
    };
  }
}