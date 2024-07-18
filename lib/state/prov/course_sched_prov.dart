import 'package:flutter/material.dart';
import 'package:smart_edu/datasource/imple/course_sched_ds.dart';
import 'package:smart_edu/presentation/helper/toast_helper.dart';
import 'package:smart_edu/presentation/helper/ui_entity_trans.dart';
import 'package:time_planner/time_planner.dart';

import '../../data/basic_data.dart';
import '../../entity/course_task.dart';
import '../../entity/general/result.dart';

class CourseSchedProv with ChangeNotifier {
  int selectedWeek = 0;
  bool selectedTerm = false;
  int selectedYear = 0;

  List<TimePlannerTask> tasks = [];

  init(){
    // basic data之后的
    selectedYear = BasicData.nowYear;
  }

  void setWeek(int week){
    selectedWeek = week;
  }

  void setYearTerm(int year, bool term){
    selectedYear = year;
    selectedTerm = term;
  }

  void setTime (int year, bool term, int week){
    selectedYear = year;
    selectedTerm = term;
    selectedWeek = week;
  }

  void setTasks(List<TimePlannerTask> tasks){
    this.tasks = tasks;
    notifyListeners();
  }

  String get timeStrKey => '$selectedYear:${selectedTerm?'1':'2'}:$selectedWeek';

  Future<void> fetchTasks({bool isDefault = false,
  }) async {
    if(isDefault){
      setTime(BasicData.nowYear, BasicData.nowTermPart, BasicData.nowWeek);
    }
    Result<List<CourseTask>> res= await CourseSchedDs.getCourseTable(selectedYear, selectedTerm, selectedWeek);
    if(res.isSuccess){
      List<CourseTask> courseTasks = res.data!;
      tasks = courseTasks.map(
          (e)=>UiEntityTrans.toTimePlannerTask(e),
      ).toList();
      notifyListeners();
    }else{
      ToastHelper.showErrorWithouDesc('${res.resCode}');
    }
  }
}