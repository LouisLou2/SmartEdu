
import '../entity/campus.dart';
import '../entity/school.dart';

class BaseInfoReq {
  final List<Campus> campusList;
  final bool nowTermPart;
  final int nowWeek;
  final int earliestTermYear;
  final bool earliestTermPart;
  final List<School> schoolMajorList;

  BaseInfoReq(
      this.campusList,
      this.nowTermPart,
      this.earliestTermYear,
      this.earliestTermPart,
      this.nowWeek,
      this.schoolMajorList,
      );

  factory BaseInfoReq.fromJson(Map<String, dynamic> json) {
    return BaseInfoReq(
      ( json['campusVOList'] as List ).map<Campus>((e) => Campus.fromJson(e)).toList(),
      json['nowTermPart'],
      json['earliestTermYear'],
      json['earliestTermPart'],
      json['nowWeek'],
      ( json['schoolMajorList'] as List ).map<School>((e) => School.fromJson(e)).toList(),
    );
  }
}