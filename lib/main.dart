
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/const/device.dart';
import 'package:smart_edu/init_affairs.dart';
import 'package:smart_edu/presentation/anim_sidebar.dart';
import 'package:smart_edu/presentation/main_dashboard.dart';
import 'package:smart_edu/style/theme_vault.dart';

void main(){
  uiInit();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: DeviceDesignDraft.desktop,
      child: ShadApp.material(
        themeMode: ThemeMode.light,
        materialThemeBuilder: (context, theme) {
          if (theme.brightness == Brightness.light) {
            return theme.copyWith(
              primaryColorLight: ThemeVault.light.primaryColorLight,
              primaryColorDark: ThemeVault.light.primaryColorDark,
              textTheme: ThemeVault.light.textTheme,
              colorScheme: ThemeVault.light.colorScheme,
            );
          }
          return theme.copyWith(
            primaryColorLight: ThemeVault.dark.primaryColorLight,
            primaryColorDark: ThemeVault.dark.primaryColorDark,
            textTheme: ThemeVault.dark.textTheme,
            colorScheme: ThemeVault.dark.colorScheme,
          );
        },
        home: const MainDashboard(),
      ),
    );
  }
}