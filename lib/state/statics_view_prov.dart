import 'package:flutter/material.dart';
import 'package:smart_edu/domain/entity/class_statics_item.dart';
import 'package:smart_edu/domain/entity/classroom_statics_mode.dart';
import 'package:smart_edu/domain/entity/student_statics_model.dart';
import 'package:smart_edu/domain/entity/teacher_statics_model.dart';
import 'package:smart_edu/domain/resp/class_statics_resp.dart';
import 'package:smart_edu/domain/resp/classroom_statics_resp.dart';
import 'package:smart_edu/domain/resp/stu_search_resp.dart';

class StaticsViewProv extends ChangeNotifier {
  late ClassStaticsResp _classStaticsModel;
  late StuSearchResp _studentStaticsModel;
  late TeacherStaticsModel _teacherStaticsModel;
  late ClassroomStaticsResp _classroomStaticsMode;

  StaticsViewProv() {
    _classStaticsModel = ClassStaticsResp();
    _studentStaticsModel = StuSearchResp();
    _teacherStaticsModel = TeacherStaticsModel();
    _classroomStaticsMode = ClassroomStaticsResp();
  }

  ClassroomStaticsResp get classroomStaticsMode => _classroomStaticsMode;
  TeacherStaticsModel get teacherStaticsModel => _teacherStaticsModel;
  StuSearchResp get studentStaticsModel => _studentStaticsModel;
  ClassStaticsResp get classStaticsModel => _classStaticsModel;

  void initClassroomStatics() {
    _classroomStaticsMode = ClassroomStaticsResp(
      classrooms: [
        ClassroomStaticItem(
          classroomId: 98,
          classroomName: "通品系主",
          campusName: "子济即现万",
          building: "dolor",
          status: "59",
          seatNum: 9,
          area: 39,
        ),
        ClassroomStaticItem(
          classroomId: 38,
          classroomName: "即天酸来还走",
          campusName: "天清西头一报",
          building: "est",
          status: "30",
          seatNum: 18,
          area: 67,
        ),
        ClassroomStaticItem(
          classroomId: 81,
          classroomName: "放圆专接你表",
          campusName: "亲长老走生人",
          building: "fugiat in adipisicing",
          status: "60",
          seatNum: 46,
          area: 3,
        ),
      ],
      sum: 32,
    );
    notifyListeners();
  }

  void initTeacherStatics() {
    _teacherStaticsModel = TeacherStaticsModel(teachers: [
      TeacherStaticsItem(
        teacherId: "1",
        schoolName: "ABC School",
        majorName: "Computer Science",
        teacherName: "John Doe",
        title: "Professor",
        picUrl: "http://dummyimage.com/400x400",
      ),
      TeacherStaticsItem(
        teacherId: "2",
        schoolName: "XYZ School",
        majorName: "Mathematics",
        teacherName: "Jane Smith",
        title: "Associate Professor",
        picUrl: "http://dummyimage.com/400x400",
      ),
    ]);
    notifyListeners();
  }

  void initStudentStatics() {
    _studentStaticsModel = StuSearchResp(students: [
      StudentStaticsItem(
        picUrl: "http://dummyimage.com/400x400",
        name: "照增飞斯学更",
        gender: "男",
        stuId: "45",
        phoneNumber: "61",
        majorId: 12,
        majorName: "细热真便时",
        birthday: "1996-08-30",
        address: "湖南省离岛屯门区",
        schoolId: 63,
        schoolName: "要门特共转造",
        gradeLevel: 66,
        indentity: "ea in amet consectetur",
      ),
      StudentStaticsItem(
        picUrl: "http://dummyimage.com/400x400",
        name: "查才点积一儿",
        gender: "女",
        stuId: "92",
        phoneNumber: "58",
        majorId: 79,
        majorName: "运主期是图想多",
        birthday: "1985-06-28",
        address: "香港特别行政区德宏傣族景颇族自治州太鲁阁",
        schoolId: 9,
        schoolName: "多气太拉复万",
        gradeLevel: 81,
        indentity: "nisi",
      )
    ]);
    notifyListeners();
  }

  void initClassStatics() {
    _classStaticsModel = ClassStaticsResp(
      classes: [
        ClassStaticsItem(
          classId: 88,
          className: "软件工程2201班",
          majorName: "软件工程",
          campusName: "铁道校区",
          startYear: 2022,
          conselorId: "辅导员id",
          maleNum: 92,
          femaleNum: 30,
        ),
        ClassStaticsItem(
          classId: 89,
          className: "软件工程2202班",
          majorName: "软件工程",
          campusName: "铁道校区",
          startYear: 2022,
          conselorId: "辅导员id",
          maleNum: 92,
          femaleNum: 30,
        ),
        ClassStaticsItem(
          classId: 90,
          className: "软件工程2203班",
          majorName: "软件工程",
          campusName: "铁道校区",
          startYear: 2022,
          conselorId: "辅导员id",
          maleNum: 92,
          femaleNum: 30,
        ),
      ],
      sum: 3,
    );
    notifyListeners();
  }

  void setClassStaticsModel(ClassStaticsResp classStaticsModel) {
    _classStaticsModel = classStaticsModel;
    notifyListeners();
  }
}
