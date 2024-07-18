import 'package:dio/dio.dart';
import 'package:smart_edu/datasource/manage/net_manager.dart';

import '../../const/rescode.dart';
import '../../entity/exam_score.dart';
import '../../entity/general/resp.dart';
import '../../entity/general/result.dart';
import '../../helper/global_exception_handler.dart';
import '../manage/net_config.dart';
import '../manage/net_path_collector.dart';

class StudentScoresDs {
  static final _baseDio = NetworkManager.normalDio;

  static Future<Result<List<ExamScore>>> getStudentScores(int year, bool termPart) async {
    try {
      Response response = await _baseDio.post(
        NetworkPathCollector.scores, // 确保这个路径在您的NetPathCollector中定义
        data: {
          'year': year,
          'termPart': termPart,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if (ResCode.isOk(res.code)) {
        final records = res.data['scores'] as List;
        List<ExamScore> list = records.map((record) => ExamScore.fromJson(record)).toList();
        return Result.success(list);
      }
      return Result.abnormal(res.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}