import 'package:dio/dio.dart';
import 'package:smart_edu/datasource/manage/net_manager.dart';

import '../../const/rescode.dart';
import '../../entity/general/resp.dart';
import '../../entity/general/result.dart';
import '../../entity/place_time.dart';
import '../../helper/global_exception_handler.dart';
import '../manage/net_config.dart';
import '../manage/net_path_collector.dart';

class BasicInfoDs {
  static final _baseDio = NetworkManager.normalDio;

  static Future<Result<PlaceTime>> getBasicInfo() async {
    try {
      Response response = await _baseDio.get(
        NetworkPathCollector.basicInfo, // 确保这个路径在您的NetPathCollector中定义
        options: NetworkConfig.json_json,
      );
      Resp res = Resp.fromJson(response.data);
      if (ResCode.isOk(res.code)) {
        return Result.success(PlaceTime.fromJson(res.data));
      }
      return Result.abnormal(res.code);
    } catch (e) {
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }
}