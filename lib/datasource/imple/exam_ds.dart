import 'package:dio/dio.dart';
import 'package:smart_edu/datasource/manage/net_manager.dart';

import '../../const/rescode.dart';
import '../../entity/exam_task.dart';
import '../../entity/general/resp.dart';
import '../../entity/general/result.dart';
import '../../helper/global_exception_handler.dart';
import '../manage/net_config.dart';
import '../manage/net_path_collector.dart';

class ExamTaskDs {
  static final _baseDio = NetworkManager.normalDio;

  static Future<Result<List<ExamTask>>> getExamTasks(String stuId) async {
    try {
      Response response = await _baseDio.post(
        NetworkPathCollector.examTasks,
        data: {
          'stuId': stuId,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if (ResCode.isOk(res.code)) {
        final records = res.data['exams'];
        List<ExamTask> list = [];
        for (var record in records) {
          list.add(ExamTask.fromJson(record));
        }
        return Result.success(list);
      }
      return Result.abnormal(res.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}