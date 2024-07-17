/// teachers : [{"teacher_id":"45","school_name":"相她元才设定表","major_name":"院可新外","teacher_name":"术能府北图元","title":"到一风式细和","pic_url":"http://dummyimage.com/400x400"},{"teacher_id":"43","school_name":"快张几","major_name":"效正华干气","teacher_name":"教元今面","title":"记组门离才","pic_url":"http://dummyimage.com/400x400"},{"teacher_id":"83","school_name":"义毛比象音线","major_name":"了都记律立后","teacher_name":"角斗准好该","title":"题共在东","pic_url":"http://dummyimage.com/400x400"}]

class TeacherStaticsModel {
  TeacherStaticsModel({
    this.teachers,
    this.sum,
  });

  TeacherStaticsModel.fromJson(dynamic json) {
    if (json['teachers'] != null) {
      teachers = [];
      json['teachers'].forEach((v) {
        teachers?.add(TeacherStaticsItem.fromJson(v));
      });
    }
    sum = json['sum'];
  }
  List<TeacherStaticsItem>? teachers;
  num? sum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (teachers != null) {
      map['teachers'] = teachers?.map((v) => v.toJson()).toList();
    }
    map['sum'] = sum;

    return map;
  }
}

/// teacher_id : "45"
/// school_name : "相她元才设定表"
/// major_name : "院可新外"
/// teacher_name : "术能府北图元"
/// title : "到一风式细和"
/// pic_url : "http://dummyimage.com/400x400"

class TeacherStaticsItem {
  TeacherStaticsItem({
    this.teacherId,
    this.schoolName,
    this.majorName,
    this.teacherName,
    this.title,
    this.picUrl,
  });

  TeacherStaticsItem.fromJson(dynamic json) {
    teacherId = json['teacherId'];
    schoolName = json['schoolName'];
    majorName = json['majorName'];
    teacherName = json['teacherName'];
    title = json['title'];
    picUrl = json['picUrl'];
  }
  String? teacherId;
  String? schoolName;
  String? majorName;
  String? teacherName;
  String? title;
  String? picUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['teacher_id'] = teacherId;
    map['school_name'] = schoolName;
    map['major_name'] = majorName;
    map['teacher_name'] = teacherName;
    map['title'] = title;
    map['pic_url'] = picUrl;
    return map;
  }
}
