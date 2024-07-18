import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_edu/data/basic_data.dart';
import 'package:smart_edu/datasource/manage/net_config.dart';
import 'package:smart_edu/handler/auth_handler.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/style/theme_vault.dart';

void uiInit(){
  ThemeVault.light = ThemeVault.light.copyWith(
    colorScheme: ThemeVault.light.colorScheme.copyWith(
      onInverseSurface: const Color(0xfff6f6f9),
      surfaceContainerHighest: const Color(0xfff8f8f9),
      surfaceContainerHigh: const Color(0xfff8f8f9),
    ),
  );
  StyleScheme.setOnSuface(
    lightOnSufColor: ThemeVault.light.colorScheme.onSurface,
    darkOnSufColor: ThemeVault.dark.colorScheme.onSurface,
    lightSufColor: ThemeVault.light.colorScheme.surface,
    darkSufColor: ThemeVault.dark.colorScheme.surface,
  );
}

Future<void> authInit() async{
  // ensureBinding
  WidgetsFlutterBinding.ensureInitialized();
  await AuthHandler.init();
  String? token=Uri.base.queryParameters['token'];
  token='eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUR1QtMy1VSEZEOXVMQWpqNGRPRk9HeW9JWHM0QVMtSHZYOGJhLTVtQnpxUC1pSE10VTU5eEpHVnc1RkNJb3dPRjQzVTBLY2tzLWlaMGpsMmNuNGo5dWQ5NnJiYmQ0cXBaIiwiZXhwIjoxNzIxMzA1Mjc5LCJpYXQiOjE3MjEyOTgwNzl9.-FbosPtGZpSu0eXuNMFUsD98EdoICrZn_2klUpw4IvU';
  if(token!=null){
    AuthHandler.setToken(token);
  }else{
    AuthHandler.checkToken();
  }
}

Future<void> initBeforeRunApp() async{
  uiInit();
  await ProvManager.init();// after authInit();
  BasicData.setAfterGet(ProvManager.initProv);
  NetworkConfig.init();// after userProv();
  ProvManager.themeProv.setThemeMode(ThemeMode.light);
}