import 'dart:core';

class ClassroomStaticItem {
  ClassroomStaticItem({
    this.classroomId,
    this.classroomName,
    this.campusName,
    this.building,
    this.status,
    this.seatNum,
    this.area,
  });
  //驼峰命名

  ClassroomStaticItem.fromJson(dynamic json) {
    classroomId = json['classroomId'];
    classroomName = json['classroomName'];
    campusName = json['campusName'];
    building = json['building'];
    status = json['status'];
    seatNum = json['seatNum'];
    area = json['area'];

    // classroomId = json['classroom_id'];
    // classroomName = json['classroom_name'];
    // campusName = json['campus_name'];
    // building = json['building'];
    // status = json['status'];
    // seatNum = json['seat_num'];
    // area = json['area'];
  }
  num? classroomId;
  String? classroomName;
  String? campusName;
  String? building;
  String? status;
  num? seatNum;
  num? area;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['classroom_id'] = classroomId;
    map['classroom_name'] = classroomName;
    map['campus_name'] = campusName;
    map['building'] = building;
    map['status'] = status;
    map['seat_num'] = seatNum;
    map['area'] = area;
    return map;
  }
}
