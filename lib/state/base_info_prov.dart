import 'package:flutter/material.dart';
import 'package:smart_edu/datasource/imple/basic_info_ds.dart';
import 'package:smart_edu/domain/entity/campus.dart';
import 'package:smart_edu/presentation/page/toast_helper.dart';

import '../domain/entity/school.dart';
import '../domain/general/result.dart';

class BaseInfoProv extends ChangeNotifier {
  List<School> schools = [];
  List<Campus> campus = [];

  Future<void> getSchoolsFromNet() async {
    Result<List<School>> resp = await BaseInfoDs.getSchoolMajor();
    if (resp.isSuccess) {
      schools = resp.data!;
      notifyListeners();
    } else {
      // ToastHelper.showFaultToast('Failed Loading Schools');
    }
  }

  Future<void> getCampusFromNet() async {
    Result<List<Campus>> resp = await BaseInfoDs.getCampusBuiding();
    if (resp.isSuccess) {
      campus = resp.data!;
      notifyListeners();
    } else {
      // ToastHelper.showFaultToast('Failed Loading Schools');
      print("获取校区信息失败");
    }
  }

  void _setSchools(List<School> schools) {
    this.schools = schools;
    notifyListeners();
  }

  void _decodeSchools(List<Map<String, dynamic>> json) {
    schools = json.map((e) => School.fromJson(e)).toList();
    notifyListeners();
  }
}
