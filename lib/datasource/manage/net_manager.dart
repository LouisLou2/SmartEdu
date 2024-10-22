import 'package:dio/dio.dart';

import 'net_config.dart';
import 'net_path_collector.dart';

class NetworkManager{

  // 默认的Dio实例,用于普通的网络请求(除聊天以及文件上传下载之外的请求)
  static final Dio _basicDio = Dio(
    BaseOptions(
      baseUrl: NetworkPathCollector.userApi,
      connectTimeout: NetworkConfig.defaultTimeout,
      receiveTimeout: NetworkConfig.defaultTimeout,
    ),
  );// 懒加载懒加载

  static Dio get normalDio=>_basicDio;
}