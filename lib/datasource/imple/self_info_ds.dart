import 'package:dio/dio.dart';
import '../../const/rescode.dart';
import '../../entity/curriculum_plan.dart';
import '../../entity/general/resp.dart';
import '../../entity/general/result.dart';
import '../../entity/student.dart';
import '../../helper/global_exception_handler.dart';
import '../manage/net_config.dart';
import '../manage/net_manager.dart';
import '../manage/net_path_collector.dart';

class SelfInfoDs {
  static final _baseDio = NetworkManager.normalDio;

  static Future<Result<Student>> getStudentInfo() async {
    try {
      Response response = await _baseDio.post(
        NetworkPathCollector.studentInfo,
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if (ResCode.isOk(res.code)) {
        return Result.success(Student.fromJson(res.data));
      }
      return Result.abnormal(res.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  static Future<Result<CurriculumPlan>> getCurriculumPlan(int majorId, int cohortYear) async {
    try {
      Response response = await _baseDio.post(
        NetworkPathCollector.curriculumPlan,
        data: {
          'majorId': majorId,
          'cohortYear': cohortYear,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if (ResCode.isOk(res.code)) {
        return Result.success(CurriculumPlan.fromJson(res.data));
      }
      return Result.abnormal(res.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
  static Future<Result<List<int>>> getTermAttendance(int year, bool termPart) async {
    try {
      Response response = await _baseDio.post(
        NetworkPathCollector.termAttendance,
        data: {
          'year': year,
          'termPart': termPart,
        },
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if (ResCode.isOk(res.code)) {
        return Result.success(List<int>.from(res.data['rates']));
      }
      return Result.abnormal(res.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  static Future<Result<int>> getCourseSelection() async{
    try {
      Response response = await _baseDio.post(
        NetworkPathCollector.courseSelection,
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if (ResCode.isOk(res.code)) {
        return Result.success(1);
      }
      return Result.abnormal(res.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}
