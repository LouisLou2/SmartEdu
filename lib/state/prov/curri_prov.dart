import 'package:flutter/material.dart';
import 'package:smart_edu/entity/curriculum_plan.dart';
import 'package:smart_edu/state/prov/user_prov.dart';
import 'package:smart_edu/state/prov_manager.dart';

import '../../const/data_status.dart';
import '../../datasource/imple/self_info_ds.dart';
import '../../entity/general/result.dart';

class CurriProv with ChangeNotifier {

  final userProv = ProvManager.userProv;

  DataStatus _state = DataStatus.initial;
  // 假设我们有一个课程列表
  CurriculumPlan? _curriculumPlan;

  DataStatus get state => _state;
  CurriculumPlan? get curriculumPlan => _curriculumPlan;

  void _setState(DataStatus newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> fetchCurriculum() async {
    _setState(DataStatus.loading);
    Result<CurriculumPlan> result = await SelfInfoDs.getCurriculumPlan(
      userProv.student!.majorId,
      userProv.student!.startYear,
    );
    if (result.isSuccess) {
      _curriculumPlan = result.data;
      _setState(DataStatus.success);
    } else {
      _setState(DataStatus.failure);
    }
  }

  void clearCurriculum() {
    _curriculumPlan = null;
    notifyListeners();
  }
}