import 'package:flutter/material.dart';

import '../../const/config.dart';
import '../../const/data_status.dart';
import '../../data/basic_data.dart';
import '../../datasource/imple/basic_info.dart';
import '../../entity/general/result.dart';
import '../../entity/place_time.dart';
class BasicDataProv extends ChangeNotifier {
  DataStatus _status = DataStatus.initial;

  DataStatus get status => _status;

  void setStatus(DataStatus status) {
    _status = status;
    notifyListeners();
  }

  Future<void> equipBasics() async {
    setStatus(DataStatus.loading);
    Result<PlaceTime> pt = await BasicInfoDs.getBasicInfo();
    for (int i = 0; i < Configs.maxRetry; ++i) {
      if (pt.isSuccess) {
        BasicData.init(
          campuses1: pt.data!.campusList,
          nowWeek1: pt.data!.nowWeek,
          nowTermPart1: pt.data!.nowTermPart,
          earliestTermYear1: pt.data!.earliestTermYear,
          earliestTermPart1: pt.data!.earliestTermPart,
          schools1: pt.data!.schoolMajorList,
        );
        setStatus(DataStatus.success);
        notifyListeners();
        return;
      }
    }
    setStatus(DataStatus.failure);
    notifyListeners();
  }
}