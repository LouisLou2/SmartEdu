import 'package:flutter/material.dart';
import 'package:smart_edu/datasource/imple/self_info_ds.dart';
import 'package:smart_edu/entity/curriculum_plan.dart';
import 'package:smart_edu/presentation/helper/toast_helper.dart';

import '../../const/data_status.dart';
import '../../entity/general/result.dart';
import '../../entity/student.dart';
import '../../handler/auth_handler.dart';

class UserProv extends ChangeNotifier {
  late String token;
  Student? student;
  CurriculumPlan? curriculumPlan;

  DataStatus status = DataStatus.loading; // 0: loading, 1: loaded, 2: failed
  bool get isLoading => status == DataStatus.loading;

  UserProv(){
    token = AuthHandler.getToken();
  }

  void setStuState(DataStatus state) {
    status = state;
    notifyListeners();
  }

  void fetchStudent() async {
    setStuState(DataStatus.loading);
    Result<Student> stu = await SelfInfoDs.getStudentInfo();
    if (stu.isSuccess) {
      student = stu.data;
      setStuState(DataStatus.success);
    } else {
      // handle abnormal
      ToastHelper.showWarningWithouDesc('获取学生信息失败');
      setStuState(DataStatus.failure);
    }
  }
}