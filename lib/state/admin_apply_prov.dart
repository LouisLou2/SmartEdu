import 'package:flutter/material.dart';
import 'package:smart_edu/domain/entity/classroom_apply_datas.dart';
import 'package:smart_edu/domain/entity/repair_report_model.dart';
import 'package:smart_edu/domain/resp/classroom_apply_resp.dart';
import 'package:smart_edu/domain/resp/repair_report_resp.dart';

class AdminApplyProv extends ChangeNotifier {
  RepairReportResp? _repairReportModel;
  ClassroomApplyResp? _classroomApplyDatas;
  ClassroomApplyResp? get classroomApplyDatas => _classroomApplyDatas;
  RepairReportResp? get repairReportModel => _repairReportModel;

  void initClassroomApplyDatas() {
    _classroomApplyDatas = ClassroomApplyResp(applications: [
      ClassroomApplyItem(
        reserveId: 1,
        teacherId: '1',
        year: 2023,
        week: 1,
        dayOfWeek: 1,
        periodFrom: 1,
        periodTo: 2,
        reason: 1,
        className: "A404",
        reasonDetail: '教学活动',
        actName: '老师教研组会议',
      )
    ]);
    notifyListeners();
  }

  void initRepairReports() {
    _repairReportModel = RepairReportResp(reports: [
      Report(
        building: '教学楼',
        campusId: 1,
        campusName: '大学城校区',
        classroomId: 101,
        classroomName: '101教室',
        faultDesc: '空调故障',
        reportId: 1,
        reportTime: '2023-10-26 10:00',
        status: 1,
      ),
      Report(
        building: '图书馆',
        campusId: 2,
        campusName: '科技园校区',
        classroomId: 202,
        classroomName: '202教室',
        faultDesc: '网络故障',
        reportId: 2,
        reportTime: '2023-10-27 14:00',
        status: 2,
      )
    ]);
    notifyListeners();
  }
}
