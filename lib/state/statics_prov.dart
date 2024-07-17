import 'package:flutter/material.dart';
import 'package:smart_edu/const/app_param.dart';
import 'package:smart_edu/datasource/imple/statistic_ds.dart';
import 'package:smart_edu/domain/entity/class_statics_item.dart';
import 'package:smart_edu/domain/entity/classroom_statics_mode.dart';
import 'package:smart_edu/domain/entity/teacher_statics_model.dart';
import 'package:smart_edu/domain/general/result.dart';
import 'package:smart_edu/domain/req/class_statics_req.dart';
import 'package:smart_edu/domain/req/classroom_statics_req.dart';
import 'package:smart_edu/domain/req/tea_search_req.dart';
import 'package:smart_edu/domain/resp/class_statics_resp.dart';
import 'package:smart_edu/domain/resp/classroom_statics_resp.dart';
import 'package:smart_edu/domain/resp/tea_search_resp.dart';
import 'package:smart_edu/helper/toast_helper.dart';
import 'package:smart_edu/state/prov_manager.dart';

class StaticsProv extends ChangeNotifier {
  //班级数据
  /*----------------------------------------------*/
  int classSum = 0;
  int classPage = 0;
  List<ClassStaticsItem> classStatics = [];
  int selectedSchool = 0;
  int selectedMajor = 0;
  int choosedYear = 0;
  ClassStaticsReq classReq = ClassStaticsReq(offset: 0, num: AppParam.pageSize);
  bool get isClassEmpty => classStatics.isEmpty;

  StaticsProv() {
    classStatics = [];
  }
  int get pageTotal => (classSum / AppParam.pageSize).ceil();

  void setReqSchool(int ind) {
    selectedSchool = ind;
    print("ind: $ind");
    if (ind == -1) {
      classReq.schoolId = null;
      notifyListeners();
      return;
    }
    classReq.schoolId = ProvManager.baseInfoProv.schools[ind].schoolId;
    notifyListeners();
  }

  void setReqMajor(int ind) {
    selectedMajor = ind;
    if (ind == -1) {
      classReq.majorId = null;
      notifyListeners();
      return;
    }
    classReq.majorId =
        ProvManager.baseInfoProv.schools[selectedSchool].majors[ind].majorId;
    notifyListeners();
  }

  void setReqYear(int year) {
    choosedYear = year;
    if (year == -1) {
      classReq.startYear = null;
      notifyListeners();
      return;
    }
    notifyListeners();
  }

  Future setClassReqPageAndSearch(int ind) async {
    classPage = ind;
    classReq.offset = ind * AppParam.pageSize;
    await getClasses();
  }

  Future getClasses() async {
    Result<ClassStaticsResp> result =
        await StatisticDs.getClassStaticsInfo(classReq);
    if (result.isSuccess) {
      classSum = result.data!.sum!.toInt();
      classStatics = result.data!.classes!;
      notifyListeners();
    } else {
      ToastHelper.showErrorWithouDesc("获取本校班级信息失败");
    }
  }

  /*-----------------------------------------------------------------------*/
  //教室数据
  int classroomSum = 0;
  int classroomPage = 0;
  List<ClassroomStaticItem> classroomStatics = [];
  int selectedCampus = 0;
  int selectedBuiding = 0;
  String roomSearchName = "";
  ClassroomStaticsReq classroomReq =
      ClassroomStaticsReq(offset: 0, num: AppParam.pageSize);
  bool get isClassroomEmpty => classroomStatics.isEmpty;

  int get classroomPageTotal => (classroomSum / AppParam.pageSize).ceil();

  void setReqCampus(int ind) {
    selectedCampus = ind;
    if (ind == -1) {
      classroomReq.campusId = null;
      notifyListeners();
      return;
    }
    classroomReq.campusId =
        ProvManager.baseInfoProv.campus[ind].campusId.toInt();
    notifyListeners();
  }

  void setReqBuilding(int ind) {
    selectedBuiding = ind;
    if (ind == -1) {
      classroomReq.building = null;
      notifyListeners();
      return;
    }
    classroomReq.building =
        ProvManager.baseInfoProv.campus[selectedCampus].building[ind];
    notifyListeners();
  }

  void setRoomSearchName(String name) {
    roomSearchName = name;
    classroomReq.classroomName = name;
    notifyListeners();
  }

  Future setClassroomReqPageAndSearch(int ind) async {
    classroomPage = ind;
    classroomReq.offset = ind * AppParam.pageSize;

    await getClassrooms();
  }

  Future getClassrooms() async {
    Result<ClassroomStaticsResp> result =
        await StatisticDs.getClassroomStaticsInfo(classroomReq);
    if (result.isSuccess) {
      classroomSum = result.data!.sum!.toInt();
      classroomStatics = result.data!.classrooms!;
      notifyListeners();
    } else {
      ToastHelper.showErrorWithouDesc("获取教室信息失败");
    }
  }

  /*-----------------------------------------------------------------------*/
  //教师数据
  int nowSum = 0;
  int nowPageInd = 0;
  TeaSearchReq nowReq = TeaSearchReq(offset: 0, num: AppParam.pageSize);
  int selectedSchoolInd = 0;
  int selectedMajorInd = 0;
  int selectedTitleInd = 0;
  int selectedGenderInd = 0; // 不限， 男， 女
  int teacherSearchCount = 0;
  List<TeacherStaticsItem> nowTeachers = [];
  bool get isTeachersEmpty => nowTeachers.isEmpty;

  int get teacherPageTotal => (nowSum / AppParam.pageSize).ceil();

  void setTeacherReqSchool(int ind) {
    selectedSchoolInd = ind;
    if (ind == -1) {
      nowReq.schoolId = null;
      notifyListeners();
      return;
    }
    nowReq.schoolId = ProvManager.baseInfoProv.schools[ind].schoolId;
    notifyListeners();
  }

  void setTeacherReqMajor(int ind) {
    if (selectedSchoolInd == -1) {
      nowReq.majorId = null;
      notifyListeners();
      return;
    }
    nowReq.majorId =
        ProvManager.baseInfoProv.schools[selectedSchoolInd].majors[ind].majorId;
    notifyListeners();
  }

  void setReqTitle(int ind) {
    selectedTitleInd = ind;
    nowReq.title = ind == 0 ? null : ind - 1;
    notifyListeners();
  }

  void setReqGender(int ind) {
    selectedGenderInd = ind;
    nowReq.gender = (ind == 0) ? null : ind == 1;
    notifyListeners();
  }

  void setReqName(String name) {
    nowReq.name = name.isEmpty ? null : name;
  }

  Future setReqPageAndSearch(int ind) async {
    nowPageInd = ind;
    nowReq.offset = ind * AppParam.pageSize;
    await searchTeachers();
  }

  Future searchTeachers() async {
    Result<TeaSearchResp> resp = await StatisticDs.getTeaSearchReq(nowReq);
    if (resp.isSuccess) {
      nowSum = resp.data!.sum;
      nowTeachers = resp.data!.teachers;
      notifyListeners();
    } else {
      ToastHelper.showErrorWithouDesc("获取教师信息失败");
    }
    ++teacherSearchCount;
    notifyListeners();
  }
}
