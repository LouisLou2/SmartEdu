import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/const/device.dart';
import 'package:smart_edu/init_affairs.dart';
import 'package:smart_edu/presentation/page/admin_page/aao_admin_dash.dart';
import 'package:smart_edu/presentation/page/admin_page/aao_main_panel.dart';
import 'package:smart_edu/presentation/page/tea_page/classroom_apply_fun/classroom_apply_page.dart';
import 'package:smart_edu/state/admin_apply_prov.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/state/statics_page_prov.dart';
import 'package:smart_edu/state/statics_view_prov.dart';
import 'package:smart_edu/presentation/anim_sidebar.dart';
import 'package:smart_edu/presentation/main_dashboard.dart';
import 'package:smart_edu/presentation/page/main_panel.dart';
import 'package:smart_edu/style/theme_vault.dart';

void main() {
  runBeforeRun();
  runApp(const MainApp());
}

void runBeforeRun() {
  uiInit();
  ProvManager.init();
}

class MainApp extends StatelessWidget {
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
          home: MultiProvider(
            providers: ProvManager.getProvList,
            child: const MainDashboard(
              subWidget: AAOMainPanel(),
            ),
          )),
    );
  }
}
