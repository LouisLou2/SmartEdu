import 'package:flutter/material.dart';
import 'package:smart_edu/const/app_param.dart';
import 'package:smart_edu/datasource/imple/apply_ds.dart';
import 'package:smart_edu/datasource/imple/repair_ds.dart';
import 'package:smart_edu/datasource/imple/statistic_ds.dart';
import 'package:smart_edu/domain/entity/classroom_apply_datas.dart';
import 'package:smart_edu/domain/entity/repair_report_model.dart';
import 'package:smart_edu/domain/entity/student_statics_model.dart';
import 'package:smart_edu/domain/req/classroom_statics_req.dart';
import 'package:smart_edu/domain/req/repair_report_req.dart';
import 'package:smart_edu/domain/req/stu_search_req.dart';
import 'package:smart_edu/domain/resp/classroom_apply_resp.dart';
import 'package:smart_edu/domain/resp/repair_report_resp.dart';
import 'package:smart_edu/domain/resp/stu_search_resp.dart';
import 'package:smart_edu/state/prov_manager.dart';

import '../domain/general/result.dart';
import '../domain/resp/tea_search_resp.dart';

class ApplyProv with ChangeNotifier {
  int nowSum = 0;
  int nowPageInd = 0;
  List<ClassroomApplyItem> nowClassrooms = [];

  /// *******************
  ClassroomStaticsReq nowReq =
      ClassroomStaticsReq(offset: 0, num: AppParam.pageSize);
  int selectedCampusInd = 0;
  int selectedBuildingInd = 0;
  int searchCount = 0;
  bool get isStudentsNull => nowClassrooms.isEmpty;

  /// *******************

  /// *******************

  ApplyProv() {
    nowSum = 0;
    nowPageInd = 0;
    nowReq = ClassroomStaticsReq(offset: 0, num: AppParam.pageSize);
  }

  int get pageTotal => (nowSum / AppParam.pageSize).ceil();

  Future setReqPageAndSearch(int ind) async {
    nowPageInd = ind;
    nowReq.offset = ind * AppParam.pageSize;
    await searchClassrooms();
  }

  void setReqCampus(int ind) {
    selectedCampusInd = ind;
    if (ind == -1) {
      nowReq.campusId = null;
      notifyListeners();
      return;
    }
    nowReq.campusId = ProvManager.baseInfoProv.campus[ind].campusId.toInt();
    notifyListeners();
  }

  void setReqBuilding(int ind) {
    selectedBuildingInd = ind;
    if (ind == -1) {
      nowReq.building = null;
      notifyListeners();
      return;
    }
    nowReq.building =
        ProvManager.baseInfoProv.campus[selectedCampusInd].building[ind];
    notifyListeners();
  }

  Future searchClassrooms() async {
    Result<ClassroomApplyResp> resp = await ApplyDs.getApplyList(nowReq);
    if (resp.isSuccess) {
      nowSum = resp.data!.sum!.toInt();
      nowClassrooms = resp.data!.applications!;
      notifyListeners();
    } else {
      // ToastHelper.showFaultToast('Failed');
      print("获取教室预约记录失败");
    }
    ++searchCount;
    notifyListeners();
  }
}
