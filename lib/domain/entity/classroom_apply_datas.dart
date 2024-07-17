import 'dart:convert';

/// applications : [{"reserve_id":1,"teacher_id":"12345678","year":2024,"week":10,"day_of_week":4,"period_from":1,"period_to":2,"reason":3,"reason_detail":"玛卡巴卡","act_name":"小组讨论"}]
/// sum : 10

/// reserve_id : 1
/// teacher_id : "12345678"
/// year : 2024
/// week : 10
/// day_of_week : 4
/// period_from : 1
/// period_to : 2
/// reason : 3
/// reason_detail : "玛卡巴卡"
/// act_name : "小组讨论"

ClassroomApplyItem applicationsFromJson(String str) =>
    ClassroomApplyItem.fromJson(json.decode(str));
String applicationsToJson(ClassroomApplyItem data) =>
    json.encode(data.toJson());

class ClassroomApplyItem {
  ClassroomApplyItem({
    num? reserveId,
    String? teacherId,
    num? year,
    String? className,
    num? week,
    num? dayOfWeek,
    num? periodFrom,
    num? periodTo,
    num? reason,
    String? reasonDetail,
    String? actName,
  }) {
    _reserveId = reserveId;
    _teacherId = teacherId;
    _year = year;
    _week = week;
    _className = className;
    _dayOfWeek = dayOfWeek;
    _periodFrom = periodFrom;
    _periodTo = periodTo;
    _reason = reason;
    _reasonDetail = reasonDetail;
    _actName = actName;
  }

  ClassroomApplyItem.fromJson(dynamic json) {
    _reserveId = json['reserveId'];
    _teacherId = json['teacherId'];
    _className = json['className'];
    _year = json['year'];
    _week = json['week'];
    _dayOfWeek = json['dayOfWeek'];
    _periodFrom = json['periodFrom'];
    _periodTo = json['periodTo'];
    _reason = json['reason'];
    _reasonDetail = json['reasonDetail'];
    _actName = json['actName'];
  }
  num? _reserveId;
  String? _teacherId;
  String? _className;
  num? _year;
  num? _week;
  num? _dayOfWeek;
  num? _periodFrom;
  num? _periodTo;
  num? _reason;
  String? _reasonDetail;
  String? _actName;
  ClassroomApplyItem copyWith({
    num? reserveId,
    String? teacherId,
    String? className,
    num? year,
    num? week,
    num? dayOfWeek,
    num? periodFrom,
    num? periodTo,
    num? reason,
    String? reasonDetail,
    String? actName,
  }) =>
      ClassroomApplyItem(
        reserveId: reserveId ?? _reserveId,
        teacherId: teacherId ?? _teacherId,
        year: year ?? _year,
        week: week ?? _week,
        className: className ?? _className,
        dayOfWeek: dayOfWeek ?? _dayOfWeek,
        periodFrom: periodFrom ?? _periodFrom,
        periodTo: periodTo ?? _periodTo,
        reason: reason ?? _reason,
        reasonDetail: reasonDetail ?? _reasonDetail,
        actName: actName ?? _actName,
      );
  num? get reserveId => _reserveId;
  String? get teacherId => _teacherId;
  num? get year => _year;
  num? get week => _week;
  String? get className => _className;
  num? get dayOfWeek => _dayOfWeek;
  num? get periodFrom => _periodFrom;
  num? get periodTo => _periodTo;
  num? get reason => _reason;
  String? get reasonDetail => _reasonDetail;
  String? get actName => _actName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reserve_id'] = _reserveId;
    map['teacher_id'] = _teacherId;
    map['year'] = _year;
    map['week'] = _week;
    map['day_of_week'] = _dayOfWeek;
    map['period_from'] = _periodFrom;
    map['period_to'] = _periodTo;
    map['reason'] = _reason;
    map['reason_detail'] = _reasonDetail;
    map['act_name'] = _actName;
    map['class_name'] = _className;
    return map;
  }
}
