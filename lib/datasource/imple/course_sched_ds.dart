import 'package:dio/dio.dart';
import 'package:smart_edu/datasource/manage/net_manager.dart';

import '../../const/rescode.dart';
import '../../entity/course_task.dart';
import '../../entity/general/resp.dart';
import '../../entity/general/result.dart';
import '../../helper/global_exception_handler.dart';
import '../manage/net_config.dart';
import '../manage/net_path_collector.dart';

class CourseSchedDs {

  static final _baseDao = NetworkManager.normalDio;

  static Future<Result<List<CourseTask>> > getCourseTable(int year, bool termPart, int week) async {
    try{
      Response response = await _baseDao.post(
        NetworkPathCollector.stuCourseSchedule,
        data: {
          'year': year,
          'termPart': termPart,
          'week': week,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if(ResCode.isOk(res.code)){
        final records = res.data['courses'];
        List<CourseTask> list = [];
        for(var record in records){
          list.add(CourseTask.fromJson(record));
        }
        return Result.success(list);
      }
      return Result.abnormal(res.code);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}