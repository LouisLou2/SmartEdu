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
      token ="eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUR1QtMi1hY1ZaT3RZeVh4OWdzZXhhR2I2RXNnS0NnVHZaMy14WERsLVpkR3o3MFRjclI5dnBCUG10bmYxT3QtdWNXN2sxLVIwLWlaMGpsMmNuNGo5dWQ5NnJiYmQ0cXBaIiwiZXhwIjoxNzIxMzA0MjgwLCJpYXQiOjE3MjEyOTcwODB9.u6BQK9wSREqCikKojqtTSsyeDdhYk3W1er5i3nOW7uY";
    } catch (e) {
      print(e);
    }
  }
}
