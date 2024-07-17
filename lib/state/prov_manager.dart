import 'package:provider/provider.dart';
import 'package:smart_edu/state/base_info_prov.dart';
import 'package:smart_edu/state/classroom_apply_prov.dart';
import 'package:smart_edu/state/page_prov.dart';
import 'package:smart_edu/state/repair_prov.dart';
import 'package:smart_edu/state/statics_page_prov.dart';
import 'package:smart_edu/state/statics_prov.dart';

import 'package:nested/nested.dart';
import 'package:smart_edu/state/student_prov.dart';
import 'package:smart_edu/state/theme_prov.dart';
import 'package:smart_edu/state/sidebar_prov.dart';
import 'package:smart_edu/state/user_prov.dart';

class ProvManager {
  static late StaticsPageProv staticsPageProv;
  static late BaseInfoProv baseInfoProv;
  static late StaticsProv staticsProv;
  static late StudentSearchProv studentSearchProv;
  static late RepairProv repairProv;
  static late ApplyProv applyProv;

  static late SidebarProv sidebarProv;
  static late ThemeProv themeProv;
  static late PageProv pageProv;
  static late UserProv userProv;

  static void init() async {
    staticsPageProv = StaticsPageProv();
    baseInfoProv = BaseInfoProv();
    staticsProv = StaticsProv();
    studentSearchProv = StudentSearchProv();
    repairProv = RepairProv();
    applyProv = ApplyProv();
    pageProv = PageProv();
    sidebarProv = SidebarProv();
    themeProv = ThemeProv();
    userProv = UserProv();
    await UserProv.example();

    baseInfoProv.getCampusFromNet();
    baseInfoProv.getSchoolsFromNet();
  }

  static List<SingleChildWidget> get getProvList => [
        ChangeNotifierProvider.value(value: staticsPageProv),
        ChangeNotifierProvider.value(value: baseInfoProv),
        ChangeNotifierProvider.value(value: staticsProv),
        ChangeNotifierProvider.value(value: studentSearchProv),
        ChangeNotifierProvider.value(value: repairProv),
        ChangeNotifierProvider.value(value: applyProv),
        ChangeNotifierProvider.value(value: sidebarProv),
        ChangeNotifierProvider.value(value: themeProv),
        ChangeNotifierProvider.value(value: pageProv),
        ChangeNotifierProvider.value(value: userProv),
      ];
}
