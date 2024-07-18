import 'package:smart_edu/state/prov/attend_prov.dart';
import 'package:smart_edu/state/prov/basic_info_prov.dart';
import 'package:smart_edu/state/prov/course_sched_prov.dart';
import 'package:smart_edu/state/prov/curri_prov.dart';
import 'package:smart_edu/state/prov/page_prov.dart';
import 'package:smart_edu/state/prov/score_inquire_prov.dart';
import 'package:smart_edu/state/prov/sidebar_prov.dart';
import 'package:smart_edu/state/prov/theme_prov.dart';
import 'package:smart_edu/state/prov/user_prov.dart';

class ProvManager {
  static late PageProv pageProv;
  static late ThemeProv themeProv;
  static late SidebarProv sidebarProv;
  static late UserProv userProv;
  static late CurriProv curriProv;
  static late CourseSchedProv courseSchedProv;
  static late ScoreInquireProv scoreInquireProv;
  static late AttendProv attendProv;
  static late BasicDataProv basicDataProv;

  static Future<void> init() async{
    pageProv = PageProv();
    themeProv = ThemeProv();
    sidebarProv = SidebarProv();
    userProv = UserProv();
    curriProv = CurriProv();
    courseSchedProv = CourseSchedProv();
    scoreInquireProv = ScoreInquireProv();
    attendProv = AttendProv();
    basicDataProv = BasicDataProv();
  }

  static void initProv() {
    // after BasicData
    courseSchedProv.init();
    scoreInquireProv.init();
  }
}