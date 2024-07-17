import 'package:flutter/material.dart';
import 'package:smart_edu/const/app_param.dart';
import 'package:smart_edu/datasource/imple/statistic_ds.dart';
import 'package:smart_edu/domain/entity/student_statics_model.dart';
import 'package:smart_edu/domain/req/stu_search_req.dart';
import 'package:smart_edu/domain/resp/stu_search_resp.dart';
import 'package:smart_edu/state/prov_manager.dart';

import '../domain/general/result.dart';
import '../domain/resp/tea_search_resp.dart';
import '../helper/toast_helper.dart';

class StudentSearchProv with ChangeNotifier {
  int nowSum = 0;
  int nowPageInd = 0;

  /// *******************
  StuSearchReq nowReq = StuSearchReq(offset: 0, num: AppParam.pageSize);
  int selectedSchoolInd = 0;
  int selectedMajorInd = 0;
  int selectedClassInd = 0;
  int selectedStartYear = 0;
  int selectedGenderInd = 0; // 不限， 男， 女
  String searchName = '';
  int searchCount = 0;
  bool get isStudentsNull => nowStudents.isEmpty;

  /// *******************
  List<StudentStaticsItem> nowStudents = [];

  /// *******************

  StudentSearchProv() {
    nowSum = 0;
    nowPageInd = 0;
    nowReq = StuSearchReq(offset: 0, num: AppParam.pageSize);
  }

  int get pageTotal => (nowSum / AppParam.pageSize).ceil();

  void setReqSchool(int ind) {
    selectedSchoolInd = ind;
    if (ind == -1) {
      nowReq.schoolId = null;
      notifyListeners();
      return;
    }
    nowReq.schoolId = ProvManager.baseInfoProv.schools[ind].schoolId;
    notifyListeners();
  }

  void setReqMajor(int ind) {
    if (selectedSchoolInd == -1) {
      nowReq.majorId = null;
      notifyListeners();
      return;
    }
    nowReq.majorId =
        ProvManager.baseInfoProv.schools[selectedSchoolInd].majors[ind].majorId;
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
    await searchStudents();
  }

  Future searchStudents() async {
    Result<StuSearchResp> resp = await StatisticDs.getStuSearchReq(nowReq);
    if (resp.isSuccess) {
      nowSum = resp.data!.sum!.toInt();
      nowStudents = resp.data!.students!;
      notifyListeners();
    } else {
      ToastHelper.showErrorWithouDesc("获取学生信息失败");
    }
    ++searchCount;
    notifyListeners();
  }
}
