import 'package:dio/dio.dart';

class DioUtil {
  static final Dio _dio = Dio(
    BaseOptions(
        // baseUrl: "http://localhost:8080",
        // connectTimeout: Duration(seconds: 10),
        // receiveTimeout: Duration(seconds: 10),
        ),
  );

  static Dio getInstance() {
    return _dio;
  }

  // get 请求
  static Future<Response> get(String url,
      {Map<String, dynamic>? params, CancelToken? cancelToken}) async {
    return await _dio.get(url,
        queryParameters: params, cancelToken: cancelToken);
  }

  // post 请求
  static Future<Response> post(String url,
      {Map<String, dynamic>? data, CancelToken? cancelToken}) async {
    return await _dio.post(url, data: data, cancelToken: cancelToken);
  }

  // put 请求
  static Future<Response> put(String url,
      {Map<String, dynamic>? data, CancelToken? cancelToken}) async {
    return await _dio.put(url, data: data, cancelToken: cancelToken);
  }

  // delete 请求
  static Future<Response> delete(String url, {CancelToken? cancelToken}) async {
    return await _dio.delete(url, cancelToken: cancelToken);
  }

  // 取消请求
  static void cancelRequests(CancelToken cancelToken) {
    cancelToken.cancel("请求已被取消");
  }
}
