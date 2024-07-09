import 'package:flutter/material.dart';

class StyleScheme{
  static const String engFontFamily = 'GoogleSans';
  static const String cnFontFamily = 'NotoSansSC';
  static String getThemeText(ThemeMode mode){
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'Auto';
    }
  }
}