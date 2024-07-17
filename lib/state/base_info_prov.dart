import 'package:flutter/material.dart';
import 'package:smart_edu/datasource/imple/basic_info_ds.dart';
import 'package:smart_edu/domain/entity/campus.dart';
import 'package:smart_edu/domain/resp/base_info_resp.dart';
import 'package:smart_edu/helper/toast_helper.dart';

import '../domain/entity/school.dart';
import '../domain/general/result.dart';

class BaseInfoProv extends ChangeNotifier {
  List<School> schools = [];
  List<Campus> campus = [];
  void _setSchools(List<School> schools) {
    this.schools = schools;
    notifyListeners();
  }

  void _decodeSchools(List<Map<String, dynamic>> json) {
    schools = json.map((e) => School.fromJson(e)).toList();
    notifyListeners();
  }
  Future<void> getBaseInfos() async{
    Result<BaseInfoResp> resp = await BaseInfoDs.getBaseInfos();
    if(resp.isSuccess){
      this.campus = resp.data!.campusList;
      this.schools = resp.data!.schoolMajorList;
      notifyListeners();
    }else{
      ToastHelper.showErrorWithouDesc('Failed Loading Base Info');
    }
  }

  // Future<void> getSchoolsFromNet() async {
  //   Result<List<School>> resp = await BaseInfoDs.getSchoolMajor();
  //   if (resp.isSuccess) {
  //     schools = resp.data!;
  //     notifyListeners();
  //   } else {
  //     // ToastHelper.showFaultToast('Failed Loading Schools');
  //   }
  // }
  //
  // Future<void> getCampusFromNet() async {
  //   Result<List<Campus>> resp = await BaseInfoDs.getCampusBuiding();
  //   if (resp.isSuccess) {
  //     campus = resp.data!;
  //     notifyListeners();
  //   } else {
  //     // ToastHelper.showFaultToast('Failed Loading Schools');
  //     print("获取校区信息失败");
  //   }
  // }


}
