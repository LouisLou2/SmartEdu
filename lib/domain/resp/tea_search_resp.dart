import 'package:smart_edu/domain/entity/teacher_statics_model.dart';

class TeaSearchResp {
  int sum;
  List<TeacherStaticsItem> teachers;

  TeaSearchResp({required this.sum, required this.teachers});

  TeaSearchResp.fromJson(Map<String, dynamic> json)
      : sum = json['sum'],
        teachers = (json['teacherDetailVOList'] as List)
            .map((e) => TeacherStaticsItem.fromJson(e))
            .toList();
}
