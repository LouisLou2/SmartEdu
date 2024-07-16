import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/widget/icon_chequer.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/try/side_bar.dart';

import '../../state/page_prov.dart';
import 'aao_main_panel.dart';

class AAOAdminDashboard extends StatefulWidget{
  const AAOAdminDashboard({super.key});

  @override
  State<AAOAdminDashboard> createState() => _AAOAdminDashboardState();
}

class _AAOAdminDashboardState extends State<AAOAdminDashboard>{

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
  Widget build(BuildContext context){
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
                      ListTile(
                        minTileHeight: 0,
                        titleAlignment: ListTileTitleAlignment.center,
                        horizontalTitleGap: 8.w,
                        contentPadding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h, bottom: 10.h),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        leading: Image.asset(
                          'assets/image/flutter_icon.png',
                          fit: BoxFit.cover,
                          width: 19.sp,
                        ),
                        title: Text(
                          'CSU Academy',
                          style: context.theme.textTheme.titleLarge?.copyWith(
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: StyleScheme.engFontFamily,
                            fontSize: 20.sp,
                          ),
                        ),
                        onTap: (){},
                        trailing: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'AAO',
                            style: context.textTheme.titleMedium?.copyWith(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: StyleScheme.engFontFamily,
                              color: context.theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 40.h,
                          ),
                          child: SearchBar(
                            leading: Icon(
                              Icons.search,
                              color: context.colorScheme.onSurfaceVariant.withOpacity(0.5),
                            ),
                            hintText: 'Search',
                            hintStyle: WidgetStatePropertyAll<TextStyle>(
                              context.textTheme.titleMedium!.copyWith(
                                color: context.colorScheme.onSurfaceVariant.withOpacity(0.5),
                                fontFamily: StyleScheme.engFontFamily,
                                letterSpacing: -0.5,
                              ),
                            ),
                            elevation: const WidgetStatePropertyAll<double>(0),
                            backgroundColor: WidgetStatePropertyAll<Color>(context.colorScheme.surfaceContainerHighest),
                            shape: const WidgetStatePropertyAll<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: ListTile(
                          minTileHeight: 0,
                          selected: true,
                          titleAlignment: ListTileTitleAlignment.center,
                          horizontalTitleGap: 6.w,
                          contentPadding: EdgeInsets.only(left: 8.w, right: 5.w, top: 5.h, bottom: 5.h),
                          selectedTileColor: context.theme.colorScheme.primary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          leading: Icon(
                            Icons.table_chart_outlined,
                            size: 18.sp,
                            color: context.theme.colorScheme.onPrimary,
                          ),
                          title: Text(
                            '学期理论课表',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.3,
                              color: context.theme.colorScheme.onPrimary,
                            ),
                          ),
                          onTap: (){},
                        ),
                      ),
                      ...List.generate(20, (index){
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                          child: ExpansionTile(
                            minTileHeight: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            title: Text(
                              '学生管理',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.3,
                                color: context.theme.colorScheme.onSurface,
                              ),
                            ),
                            children: [
                              ListTile(
                                minTileHeight: 0,
                                titleAlignment: ListTileTitleAlignment.center,
                                horizontalTitleGap: 6.w,
                                contentPadding: EdgeInsets.only(left: 8.w, right: 5.w, top: 5.h, bottom: 5.h),
                                selectedTileColor: context.theme.colorScheme.primary,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                leading: Icon(
                                  Icons.table_chart_outlined,
                                  size: 16.sp,
                                  color: context.theme.colorScheme.onPrimary,
                                ),
                                title: Text(
                                  '学年第一学期',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.3,
                                    color: context.theme.colorScheme.onSurface,
                                  ),
                                ),
                                onTap: (){},
                              ),
                              ListTile(
                                minTileHeight: 0,
                                titleAlignment: ListTileTitleAlignment.center,
                                horizontalTitleGap: 6.w,
                                contentPadding: EdgeInsets.only(left: 8.w, right: 5.w, top: 0, bottom: 0),
                                selectedTileColor: context.theme.colorScheme.primary,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                leading: Icon(
                                  Icons.table_chart_outlined,
                                  size: 16.sp,
                                  color: context.theme.colorScheme.onPrimary,
                                ),
                                title: Text(
                                  '学年第一学期',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.3,
                                    color: context.theme.colorScheme.onSurface,
                                  ),
                                ),
                                onTap: (){},
                              ),
                            ],
                          ),
                        );
                      }),
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
                    return const AAOMainPanel();
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
}