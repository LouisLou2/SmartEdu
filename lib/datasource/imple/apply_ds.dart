import 'package:dio/dio.dart';
import 'package:smart_edu/const/rescode.dart';
import 'package:smart_edu/datasource/manage/net_config.dart';
import 'package:smart_edu/datasource/manage/network_manager.dart';
import 'package:smart_edu/datasource/manage/network_path_collector.dart';
import 'package:smart_edu/domain/entity/classroom_statics_mode.dart';
import 'package:smart_edu/domain/entity/student_statics_model.dart';
import 'package:smart_edu/domain/general/resp.dart';
import 'package:smart_edu/domain/general/result.dart';
import 'package:smart_edu/domain/req/class_statics_req.dart';
import 'package:smart_edu/domain/req/classroom_statics_req.dart';
import 'package:smart_edu/domain/req/repair_report_req.dart';
import 'package:smart_edu/domain/req/stu_search_req.dart';
import 'package:smart_edu/domain/req/tea_search_req.dart';
import 'package:smart_edu/domain/resp/class_statics_resp.dart';
import 'package:smart_edu/domain/resp/classroom_apply_resp.dart';
import 'package:smart_edu/domain/resp/classroom_statics_resp.dart';
import 'package:smart_edu/domain/resp/repair_report_resp.dart';
import 'package:smart_edu/domain/resp/stu_search_resp.dart';
import 'package:smart_edu/domain/resp/tea_search_resp.dart';
import 'package:smart_edu/helper/global_exception_handler.dart';

class ApplyDs {
  static final _baseDio = NetworkManager.normalDio;

  //获取教室预约的列表
  static Future<Result<ClassroomApplyResp>> getApplyList(
      ClassroomStaticsReq req) async {
    try {
      Response response = await _baseDio.post(NetworkPathCollector.applyList,
          data: req.toJson(), options: NetworkConfig.json_json);
      Resp resp = Resp.fromJson(response.data);
      if (ResCode.isOk(resp.code)) {
        return Result.success(ClassroomApplyResp.fromJson(resp.data));
      }
      return Result.abnormal(resp.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  static Future<Result<String>> applyClassroom(
      int reserveId,String detail,int result) async {
    try {
      Response response = await _baseDio.post(NetworkPathCollector.applyClassroom,
          data: {
            "reserveId":reserveId,
            "detail":detail,
            "result":result
          }, options: NetworkConfig.json_json);
      Resp resp = Resp.fromJson(response.data);
      if (ResCode.isOk(resp.code)) {
        return Result.success(resp.code.toString());
      }
      return Result.abnormal(resp.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}
