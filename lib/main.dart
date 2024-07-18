import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/const/device.dart';
import 'package:smart_edu/data/web_data.dart';
import 'package:smart_edu/init_affairs.dart';
import 'package:smart_edu/presentation/page/main_dashboard.dart';
import 'package:smart_edu/presentation/page/teaching_visual/course_detail.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/style/theme_vault.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

String? token;

void getAndSetUrl(){
  String myurl = Uri.base.toString(); //get complete url
  WebData.setUrl(myurl);
}

Future<void> main() async{
  usePathUrlStrategy(); //use path url strategy
  getAndSetUrl();
  await authInit();
  await initBeforeRunApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: DeviceDesignDraft.desktop,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: ProvManager.pageProv),
          ChangeNotifierProvider.value(value: ProvManager.themeProv),
          ChangeNotifierProvider.value(value: ProvManager.sidebarProv),
          ChangeNotifierProvider.value(value: ProvManager.userProv),
          ChangeNotifierProvider.value(value: ProvManager.curriProv),
          ChangeNotifierProvider.value(value: ProvManager.courseSchedProv),
          ChangeNotifierProvider.value(value: ProvManager.scoreInquireProv),
          ChangeNotifierProvider.value(value: ProvManager.attendProv),
          ChangeNotifierProvider.value(value: ProvManager.basicDataProv),
        ],
        child: ToastificationWrapper(
          child: ShadApp.material(
            routes: {
              '/student': (context) => const MainDashboard(),
              '/course_detail': (context)=> const CourseDetail(),
            },
            themeMode: ProvManager.themeProv.mode,
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
        ),
      ),
    );
  }
}