import 'dart:convert';

import 'package:smart_edu/domain/entity/classroom_apply_datas.dart';

ClassroomApplyResp classroomApplyDatasFromJson(String str) =>
    ClassroomApplyResp.fromJson(json.decode(str));
String classroomApplyDatasToJson(ClassroomApplyResp data) =>
    json.encode(data.toJson());

class ClassroomApplyResp {
  ClassroomApplyResp({
    List<ClassroomApplyItem>? applications,
    num? sum,
  }) {
    _applications = applications;
    _sum = sum;
  }

  ClassroomApplyResp.fromJson(dynamic json) {
    if (json['reservations'] != null) {
      _applications = [];
      json['reservations'].forEach((v) {
        _applications?.add(ClassroomApplyItem.fromJson(v));
      });
    }
    _sum = json['sum'];
  }
  List<ClassroomApplyItem>? _applications;
  num? _sum;
  ClassroomApplyResp copyWith({
    List<ClassroomApplyItem>? applications,
    num? sum,
  }) =>
      ClassroomApplyResp(
        applications: applications ?? _applications,
        sum: sum ?? _sum,
      );
  List<ClassroomApplyItem>? get applications => _applications;
  num? get sum => _sum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_applications != null) {
      map['applications'] = _applications?.map((v) => v.toJson()).toList();
    }
    map['sum'] = _sum;
    return map;
  }
}
