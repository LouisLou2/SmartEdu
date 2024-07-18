import 'package:flutter/material.dart';
import 'package:smart_edu/data/basic_data.dart';

import '../../const/data_status.dart';
import '../../datasource/imple/self_info_ds.dart';
import '../../entity/general/result.dart';
import '../../presentation/helper/toast_helper.dart';

class AttendProv extends ChangeNotifier {
  DataStatus status = DataStatus.initial;
  List<int> attendList = [];

  void setAttendState(DataStatus state) {
    status = state;
    notifyListeners();
  }

  // fetch attend list, 获取本学期
  Future<void> fetchAttendList() async {
    setAttendState(DataStatus.loading);
    Result<List<int>> attend = await SelfInfoDs.getTermAttendance(BasicData.nowYear, BasicData.nowTermPart);
    if (attend.isSuccess) {
      attendList = attend.data!;
      setAttendState(DataStatus.success);
    } else {
      // handle abnormal
      ToastHelper.showWarningWithouDesc('获取学生信息失败');
      setAttendState(DataStatus.failure);
    }
  }
}