
import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';

import '../../const/business_const.dart';
import '../../entity/course_task.dart';

class UiEntityTrans{
  static TimePlannerTask toTimePlannerTask(CourseTask task){
    return TimePlannerTask(
        dateTime: BusinessConst.getCourseBeginTime(task.dayOfWeek,task.periodFrom),
        minutesDuration: BusinessConst.getMinutesDuration(task.periodFrom,task.periodTo),
        color: Colors.purple,
        child: Text(
          task.courseName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        )
    );
  }
}