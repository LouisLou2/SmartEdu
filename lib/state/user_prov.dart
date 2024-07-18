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
      token ="eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUR1QtNC0tRHhUZndBajk2UVplRjRqcVZpN0djNUVZOTJldUdZc1FrYzlHQ1Q4RDFOeWc1b3QzZWhZYTAwQ1R6Vi04aTBCcUQwLWlaMGpsMmNuNGo5dWQ5NnJiYmQ0cXBaIiwiZXhwIjoxNzIxMjc1Mzc3LCJpYXQiOjE3MjEyNjgxNzd9.0-sKlsSYCaYPpY6r9J1ayQlpThCgokDZPq75LrXM4-w";
    } catch (e) {
      print(e);
    }
  }
}
