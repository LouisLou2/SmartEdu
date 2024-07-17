import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_edu/domain/general/resp.dart';

class UserProv extends ChangeNotifier {
  static late String token;
  static Future<void> example() async {
    try {
      // Response response = await Dio().post(
      //   'http://192.168.51.81:8080/auth/login',
      //   queryParameters: {
      //     'username': '12345678',
      //     'password': '12345678',
      //   },
      // );
      // Resp resp = Resp.fromJson(response.data);
      // print(resp.data.token);
      // token = resp.data.token;
      token ="eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUR1QtMS1ZbnhiSzllcS1OdTVKVDRVd3V4c1NSR0ZQNnUtWDk0UjhOTE1hdTBrS1NibUs4QlNMTWJZdEdkcnh0SDJCZkwxMFBzLWlaMGpsMmNuNGo5dWQ5NnJiYmQ0cXBaIiwiZXhwIjoxNzIxMjI0OTc4LCJpYXQiOjE3MjEyMjEzNzh9.mC-DWxjS0dH4xOyeU6Fwv_KS5HZNvyG4uAjv_Nayu2I";
    } catch (e) {
      print(e);
    }
  }
}
