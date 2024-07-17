import 'package:flutter/material.dart';
import 'package:smart_edu/const/app_param.dart';
import 'package:smart_edu/datasource/imple/repair_ds.dart';
import 'package:smart_edu/datasource/imple/statistic_ds.dart';
import 'package:smart_edu/domain/entity/repair_report_model.dart';
import 'package:smart_edu/domain/entity/student_statics_model.dart';
import 'package:smart_edu/domain/req/repair_report_req.dart';
import 'package:smart_edu/domain/req/stu_search_req.dart';
import 'package:smart_edu/domain/resp/repair_report_resp.dart';
import 'package:smart_edu/domain/resp/stu_search_resp.dart';
import 'package:smart_edu/state/prov_manager.dart';

import '../domain/general/result.dart';
import '../domain/resp/tea_search_resp.dart';
import '../helper/toast_helper.dart';

class RepairProv with ChangeNotifier {
  int nowSum = 0;
  int nowPageInd = 0;
  List<Report> nowReports = [];

  /// *******************
  RepairReportReq nowReq = RepairReportReq(offset: 0, num: AppParam.pageSize);
  int selectedCampusInd = 0;
  int selectedBuildingInd = 0;
  int selectedRoomInd = 0;
  int searchCount = 0;
  bool get isStudentsNull => nowReports.isEmpty;

  /// *******************    status = json['status']==0?"已维修":"未维修";

  int? nowReportId;
  String? nowDetail;
  /// *******************

  RepairProv() {
    nowSum = 0;
    nowPageInd = 0;
    nowReq = RepairReportReq(offset: 0, num: AppParam.pageSize);
  }

  int get pageTotal => (nowSum / AppParam.pageSize).ceil();

  void setNowReportId(int id) {
    nowReportId = id;
    notifyListeners();
  }
  void setNowDetail(String detail) {
    nowDetail = detail;
    notifyListeners();
  }

  Future setReqPageAndSearch(int ind) async {
    nowPageInd = ind;
    nowReq.offset = ind * AppParam.pageSize;
    await searchReports();
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

  Future searchReports() async {
    Result<RepairReportResp> resp = await RepairDs.getRepairReports(nowReq);
    if (resp.isSuccess) {
      nowSum = resp.data!.sum!.toInt();
      nowReports = resp.data!.reports!;
      notifyListeners();
    } else {
      ToastHelper.showErrorWithouDesc("获取保修列表失败");
    }
    ++searchCount;
    notifyListeners();
  }
  Future<bool> carryOutRepair() async {
    Result<String> resp = await RepairDs.carryOutRepair(nowReportId!,nowDetail!);
    if (resp.isSuccess) {
      ToastHelper.showSuccess("审批成功");
      return true;
    } else {
      ToastHelper.showErrorWithouDesc("审批失败");
      return false;
    }
    notifyListeners();
  }
}
