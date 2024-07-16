import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/entity/ui_tool/bar_tile.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/page/t_page/classroom_record.dart';
import 'package:smart_edu/presentation/page/t_page/fault_list.dart';
import 'package:smart_edu/presentation/page/t_page/teacher_course_list.dart';
import 'package:smart_edu/presentation/page/t_page/teacher_main_panel.dart';
import 'package:smart_edu/presentation/page/t_page/teacher_schedule.dart';
import 'package:smart_edu/presentation/widget/const_widgets/siderbar_header_ac.dart';
import 'package:smart_edu/presentation/widget/icon_chequer.dart';
import 'package:smart_edu/presentation/widget/leading_title.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/state/sidebar_prov.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/try/side_bar.dart';

import '../../../entity/role_enum.dart';
import '../../../entity/ui_tool/sidebar_data.dart';
import '../../../entity/ui_tool/sub_bar_tile.dart';
import '../../../state/page_prov.dart';
import '../../widget/const_widgets/custom_searchbar.dart';
import '../../widget/sidebar.dart';

class TeaDashboard extends StatefulWidget{
  const TeaDashboard({super.key});
  @override
  State<TeaDashboard> createState() => _TeaDashboardState();
}

class _TeaDashboardState extends State<TeaDashboard>{
  final TextEditingController _sController = TextEditingController();
  late final SidebarData sidebarData;
  final SidebarProv _sProv = ProvManager.sidebarProv;

  List<BarTile> barTiles = [
    BarTile.noSub(
      title: '首页',
      icon: Icons.home,
    ),
    BarTile.noSub(
      title: '我的课表',
      icon: Icons.home,
    ),
    BarTile.noSub(
      title: '我的授课',
      icon: Icons.home,
    ),
    BarTile.noSub(
      title: '我的报修',
      icon: Icons.home,
    ),
  ];

  Widget getTerminalWidget(int role) {
    IconData data;
    late String text;
    switch (role) {
      case 0:
        text = 'Student';
        break;
      case 1:
        text = 'Teacher';
        break;
      case 2:
        text = 'AAO Admin';
        break;
    }
    return Text(
      text,
    );
  }

  Widget getThemeWidget(ThemeMode mode){
    IconData data;
    String text = StyleScheme.getThemeText(mode);
    switch (mode) {
      case ThemeMode.light:
        data = Icons.sunny;
        break;
      case ThemeMode.dark:
        data = Icons.nightlight_round;
        break;
      case ThemeMode.system:
        data = Icons.auto_awesome;
        break;
    }
    return Wrap(
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10.w,
      children: [
        Icon(
          data,
          size: 20.sp,
        ),
        Text(
          text,
        ),
      ],
    );
  }

  @override
  void initState(){
    _sProv.reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    final mtheme = context.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 250.w),
          child: Drawer(
            elevation: 0,
            backgroundColor: context.theme.colorScheme.surface,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide.none,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      const SidebarHeaderAC(
                        role: Role.teacher,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 40.h,
                          ),
                          child: CustomSearchbar(
                            controller: _sController,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Selector<SidebarProv, int>(
                          selector: (context, prov) => prov.selectedId,
                          shouldRebuild: (prev, next) => prev != next,
                          builder: (context, ind, child)=> getSideTile(
                            title: '首页',
                            icon: Icons.home,
                            selected: ind == 0,
                            onTap: (){
                              _sProv.setSelectedId(0);
                              ProvManager.pageProv.setPage(2, 0);
                            },
                          ),
                        )
                      ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Selector<SidebarProv, int>(
                          selector: (context, prov) => prov.selectedId,
                          shouldRebuild: (prev, next) => prev != next,
                          builder: (context, ind, child)=> getSideTile(
                            title: '我的课表',
                            icon: Icons.home,
                            selected: ind == 1,
                            onTap: (){
                              _sProv.setSelectedId(1);
                              ProvManager.pageProv.setPage(2, 1);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Selector<SidebarProv, int>(
                          selector: (context, prov) => prov.selectedId,
                          shouldRebuild: (prev, next) => prev != next,
                          builder: (context, ind, child)=> getSideTile(
                            title: '我的授课',
                            icon: Icons.home,
                            selected: ind == 2,
                            onTap: (){
                              _sProv.setSelectedId(2);
                              ProvManager.pageProv.setPage(2, 2);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Selector<SidebarProv, int>(
                          selector: (context, prov) => prov.selectedId,
                          shouldRebuild: (prev, next) => prev != next,
                          builder: (context, ind, child)=> getSideTile(
                            title: '错误上报',
                            icon: Icons.home,
                            selected: ind == 3,
                            onTap: (){
                              _sProv.setSelectedId(3);
                              ProvManager.pageProv.setPage(2, 3);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Selector<SidebarProv, int>(
                          selector: (context, prov) => prov.selectedId,
                          shouldRebuild: (prev, next) => prev != next,
                          builder: (context, ind, child)=> getSideTile(
                            title: '教室申请',
                            icon: Icons.home,
                            selected: ind == 4,
                            onTap: (){
                              _sProv.setSelectedId(4);
                              ProvManager.pageProv.setPage(2, 4);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.start,
                    spacing: 20.w,
                    children: [
                      const IconChequer(icon: Icons.sunny, color: Colors.amber,),
                      Icon(
                        Icons.notifications_active,
                        color: context.colorScheme.primary,
                        size: 30.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Scaffold(
            backgroundColor: context.theme.colorScheme.surfaceContainerHighest,
            body: Selector<PageProv, int>(
              selector: (context, prov) => prov.page[2],
              shouldRebuild: (prev, next) => prev != next,
              builder: (context, pageIndex, child) {
                switch (pageIndex) {
                  case 0:
                    return const TeaMainPanel();
                  case 1:
                    return const TeacherSched();
                  case 2:
                    return const TeacherCourseList();
                  case 3:
                    return const TeacherFaultList();
                  case 4:
                    return const ClassroomRecord();
                  default:
                    return const Center(
                      child: Text('No Page Found'),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget getSideTile({
    required String title,
    IconData? icon,
    required bool selected,
    required VoidCallback onTap,
  }){
    return ListTile(
      minTileHeight: 0,
      selected: selected,
      titleAlignment: ListTileTitleAlignment.center,
      horizontalTitleGap: 6.w,
      contentPadding: EdgeInsets.only(left: 8.w, right: 5.w, top: 5.h, bottom: 5.h),
      selectedTileColor: context.theme.colorScheme.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      leading: icon!=null ? Icon(
        icon,
        size: 22.sp,
        color: selected ? context.theme.colorScheme.onPrimary : context.theme.colorScheme.onSurface,
      ):null,

      title: Text(
        title,
        style: StyleScheme.cn_onSuf_500_LPN03(
          size: 15.sp,
          color: selected ? context.theme.colorScheme.onPrimary: context.theme.colorScheme.onSurface,
        ),
      ),
      onTap: onTap,
    );
  }
}