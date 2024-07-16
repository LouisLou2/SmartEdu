import 'package:smart_edu/state/page_prov.dart';
import 'package:smart_edu/state/sidebar_prov.dart';
import 'package:smart_edu/state/theme_prov.dart';

class ProvManager {
  static late PageProv pageProv;
  static late ThemeProv themeProv;
  static late SidebarProv sidebarProv;

  static void init(){
    pageProv = PageProv();
    themeProv = ThemeProv();
    sidebarProv = SidebarProv();
  }
}