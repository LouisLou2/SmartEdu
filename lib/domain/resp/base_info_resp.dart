
import '../entity/campus.dart';
import '../entity/school.dart';

class BaseInfoResp {
  final List<Campus> campusList;
  final bool nowTermPart;
  final int nowWeek;
  final int earliestTermYear;
  final bool earliestTermPart;
  final List<School> schoolMajorList;

  BaseInfoResp(
      this.campusList,
      this.nowTermPart,
      this.earliestTermYear,
      this.earliestTermPart,
      this.nowWeek,
      this.schoolMajorList,
      );

  factory BaseInfoResp.fromJson(Map<String, dynamic> json) {
    return BaseInfoResp(
      ( json['campusVOList'] as List ).map<Campus>((e) => Campus.fromJson(e)).toList(),
      json['nowTermPart'],
      json['earliestTermYear'],
      json['earliestTermPart'],
      json['nowWeek'],
      ( json['schoolMajorList'] as List ).map<School>((e) => School.fromJson(e)).toList(),
    );
  }
}