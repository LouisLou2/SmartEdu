import 'package:smart_edu/domain/entity/classroom_statics_mode.dart';

class ClassroomStaticsResp {
  ClassroomStaticsResp({
    this.classrooms,
    this.sum,
  });

  ClassroomStaticsResp.fromJson(dynamic json) {
    if (json['classrooms'] != null) {
      classrooms = [];
      json['classrooms'].forEach((v) {
        classrooms?.add(ClassroomStaticItem.fromJson(v));
      });
    }
    sum = json['sum'];
  }
  List<ClassroomStaticItem>? classrooms;
  num? sum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (classrooms != null) {
      map['classrooms'] = classrooms?.map((v) => v.toJson()).toList();
    }
    map['sum'] = num;
    return map;
  }
}
