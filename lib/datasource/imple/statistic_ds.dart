import 'package:dio/dio.dart';
import 'package:smart_edu/const/rescode.dart';
import 'package:smart_edu/datasource/manage/net_config.dart';
import 'package:smart_edu/datasource/manage/network_manager.dart';
import 'package:smart_edu/datasource/manage/network_path_collector.dart';
import 'package:smart_edu/domain/entity/student_statics_model.dart';
import 'package:smart_edu/domain/general/resp.dart';
import 'package:smart_edu/domain/general/result.dart';
import 'package:smart_edu/domain/req/class_statics_req.dart';
import 'package:smart_edu/domain/req/classroom_statics_req.dart';
import 'package:smart_edu/domain/req/stu_search_req.dart';
import 'package:smart_edu/domain/req/tea_search_req.dart';
import 'package:smart_edu/domain/resp/class_statics_resp.dart';
import 'package:smart_edu/domain/resp/classroom_statics_resp.dart';
import 'package:smart_edu/domain/resp/stu_search_resp.dart';
import 'package:smart_edu/domain/resp/tea_search_resp.dart';
import 'package:smart_edu/helper/global_exception_handler.dart';

class StatisticDs {
  static final _baseDio = NetworkManager.normalDio;

  //获取班级统计信息
  static Future<Result<ClassStaticsResp>> getClassStaticsInfo(
      ClassStaticsReq req) async {
    try {
      Response response = await _baseDio.get(NetworkPathCollector.classStatics,
          data: req.toJson(), options: NetworkConfig.json_json);
      Resp resp = Resp.fromJson(response.data);
      if (ResCode.isOk(resp.code)) {
        return Result.success(ClassStaticsResp.fromJson(resp.data));
      }
      return Result.abnormal(resp.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  static Future<Result<ClassroomStaticsResp>> getClassroomStaticsInfo(
      ClassroomStaticsReq req) async {
    try {
      Response response = await _baseDio.post(
          NetworkPathCollector.classroomStatics,
          data: req.toJson(),
          options: NetworkConfig.json_json);
      Resp resp = Resp.fromJson(response.data);
      if (ResCode.isOk(resp.code)) {
        return Result.success(ClassroomStaticsResp.fromJson(resp.data));
      }
      return Result.abnormal(resp.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  static Future<Result<TeaSearchResp>> getTeaSearchReq(TeaSearchReq req) async {
    try {
      Response response = await _baseDio.get(
        NetworkPathCollector.teachers,
        data: req.toJson(),
        options: NetworkConfig.json_json,
      );
      Resp resp = Resp.fromJson(response.data);
      if (ResCode.isOk(resp.code)) {
        return Result.success(TeaSearchResp.fromJson(resp.data));
      }
      return Result.abnormal(resp.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  static Future<Result<StuSearchResp>> getStuSearchReq(StuSearchReq req) async {
    try {
      Response response = await _baseDio.get(
        NetworkPathCollector.student,
        data: req.toJson(),
        options: NetworkConfig.json_json,
      );
      Resp resp = Resp.fromJson(response.data);
      if (ResCode.isOk(resp.code)) {
        return Result.success(StuSearchResp.fromJson(resp.data));
      }
      return Result.abnormal(resp.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}
