import 'package:smart_edu/domain/entity/student_statics_model.dart';

class StuSearchResp {
  StuSearchResp({
    this.students,
    this.sum,
  });

  StuSearchResp.fromJson(dynamic json) {
    if (json['students'] != null) {
      students = [];
      json['students'].forEach((v) {
        students?.add(StudentStaticsItem.fromJson(v));
      });
    }
    sum = json['sum'];
  }
  List<StudentStaticsItem>? students;
  num? sum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (students != null) {
      map['students'] = students?.map((v) => v.toJson()).toList();
    }
    map['sum'] = sum;
    return map;
  }
}
