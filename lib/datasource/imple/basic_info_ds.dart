import 'package:dio/dio.dart';
import 'package:smart_edu/const/rescode.dart';
import 'package:smart_edu/datasource/manage/net_config.dart';
import 'package:smart_edu/datasource/manage/network_manager.dart';
import 'package:smart_edu/datasource/manage/network_path_collector.dart';
import 'package:smart_edu/domain/entity/campus.dart';
import 'package:smart_edu/domain/entity/school.dart';
import 'package:smart_edu/domain/resp/base_info_resp.dart';
import 'package:smart_edu/helper/global_exception_handler.dart';

import '../../domain/general/resp.dart';
import '../../domain/general/result.dart';

class BaseInfoDs {
  static final _baseDio = NetworkManager.normalDio;
  static Future<Result<BaseInfoResp>> getBaseInfos() async {
    try{
      Response response = await _baseDio.get(
        NetworkPathCollector.baseInfo,
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if(ResCode.isOk(res.code)){
        return Result.success(BaseInfoResp.fromJson(res.data));
      }
      return Result.abnormal(res.code);
    }catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
  static Future<Result<List<School>>> getSchoolMajor() async {
    try {
      Response response = await _baseDio.get(
        "http://localhost:3000/school_major",
        options: NetworkConfig.json_json,
      );
      Resp resp = Resp.fromJson(response.data);
      if (ResCode.isOk(resp.code)) {
        final data = resp.data['school_major_list'];
        return Result.success(
          (data as List).map((e) => School.fromJson(e)).toList(),
        );
      }
      return Result.abnormal(resp.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  static Future<Result<List<Campus>>> getCampusBuiding() async {
    try {
      Response response = await _baseDio.get(
        "http://localhost:3000/campus_building",
        options: NetworkConfig.json_json,
      );
      Resp resp = Resp.fromJson(response.data);
      if (ResCode.isOk(resp.code)) {
        final data = resp.data['campus'];
        return Result.success(
          (data as List).map((e) => Campus.fromJson(e)).toList(),
        );
      }
      return Result.abnormal(resp.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}
