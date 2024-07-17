import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/page/admin_page/statistic_show_fun/classes_table.dart';
import 'package:smart_edu/presentation/page/admin_page/statistic_show_fun/classrooms_table.dart';
import 'package:smart_edu/presentation/page/admin_page/statistic_show_fun/students_table.dart';
import 'package:smart_edu/presentation/page/admin_page/statistic_show_fun/teachers_table.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/state/statics_page_prov.dart';

class StatisticShow extends StatefulWidget {
  const StatisticShow({Key? key}) : super(key: key);

  @override
  _StatisticShowState createState() => _StatisticShowState();
}

class _StatisticShowState extends State<StatisticShow> {
  final StaticsPageProv spp = ProvManager.staticsPageProv;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<StaticsPageProv, int>(
      selector: (p0, p1) => p1.page,
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, page, child) {
        return Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 190.w,
                ),
                child: Drawer(
                  elevation: 0,
                  backgroundColor: context.theme.colorScheme.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(
                            left: 8.w, right: 20.w, top: 0, bottom: 0),
                        horizontalTitleGap: 6.w,
                        leading: const Icon(Icons.list),
                        title: Text(
                          '统计信息',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onTap: () {
                          Provider.of<StaticsPageProv>(context, listen: false)
                              .setPage(0);
                        },
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: ListTile(
                          minTileHeight: 0,
                          selected: page == 0,
                          titleAlignment: ListTileTitleAlignment.center,
                          horizontalTitleGap: 6.w,
                          contentPadding: EdgeInsets.only(
                              left: 8.w, right: 20.w, top: 0, bottom: 0),
                          selectedTileColor: page == 0
                              ? context.theme.colorScheme.primary
                              : context.theme.colorScheme.secondary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          leading: Icon(
                            Icons.table_chart_outlined,
                            size: 18.sp,
                            color: page == 0
                                ? context.theme.colorScheme.onPrimary
                                : context.theme.colorScheme.secondary,
                          ),
                          title: Text(
                            '班级信息',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.3,
                              color: page == 0
                                  ? context.theme.colorScheme.onPrimary
                                  : context.theme.colorScheme.secondary,
                            ),
                          ),
                          onTap: () {
                            Provider.of<StaticsPageProv>(context, listen: false)
                                .setPage(0);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        child: ListTile(
                          minTileHeight: 0,
                          horizontalTitleGap: 6.w,
                          selected: page == 1,
                          selectedTileColor: page == 1
                              ? context.theme.colorScheme.primary
                              : context.theme.colorScheme.secondary,
                          contentPadding: EdgeInsets.only(
                              left: 8.w, right: 20.w, top: 0, bottom: 0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          leading: Icon(
                            Icons.table_chart_outlined,
                            size: 18.sp,
                            color: page == 1
                                ? context.theme.colorScheme.onPrimary
                                : context.theme.colorScheme.secondary,
                          ),
                          title: Text(
                            '学生信息',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.3,
                              color: page == 1
                                  ? context.theme.colorScheme.onPrimary
                                  : context.theme.colorScheme.secondary,
                            ),
                          ),
                          onTap: () {
                            Provider.of<StaticsPageProv>(context, listen: false)
                                .setPage(1);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: ListTile(
                          minTileHeight: 0,
                          selected: page == 2,
                          selectedTileColor: page == 2
                              ? context.theme.colorScheme.primary
                              : context.theme.colorScheme.secondary,
                          horizontalTitleGap: 6.w,
                          contentPadding: EdgeInsets.only(
                              left: 8.w, right: 20.w, top: 0, bottom: 0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          leading: Icon(
                            Icons.table_chart_outlined,
                            size: 18.sp,
                            color: page == 2
                                ? context.theme.colorScheme.onPrimary
                                : context.theme.colorScheme.secondary,
                          ),
                          title: Text(
                            '老师信息',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.3,
                              color: page == 2
                                  ? context.theme.colorScheme.onPrimary
                                  : context.theme.colorScheme.secondary,
                            ),
                          ),
                          onTap: () {
                            Provider.of<StaticsPageProv>(context, listen: false)
                                .setPage(2);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: ListTile(
                          minTileHeight: 0,
                          horizontalTitleGap: 6.w,
                          selected: page == 3,
                          selectedTileColor: page == 3
                              ? context.theme.colorScheme.primary
                              : context.theme.colorScheme.secondary,
                          contentPadding: EdgeInsets.only(
                              left: 8.w, right: 20.w, top: 0, bottom: 0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          leading: Icon(
                            Icons.table_chart_outlined,
                            size: 18.sp,
                            color: page == 3
                                ? context.theme.colorScheme.onPrimary
                                : context.theme.colorScheme.secondary,
                          ),
                          title: Text(
                            '教室信息',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.3,
                              color: page == 3
                                  ? context.theme.colorScheme.onPrimary
                                  : context.theme.colorScheme.secondary,
                            ),
                          ),
                          onTap: () {
                            Provider.of<StaticsPageProv>(context, listen: false)
                                .setPage(3);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            VerticalDivider(
              width: 1.w,
              thickness: 1,
              color: context.theme.colorScheme.onSurface.withOpacity(0.1),
            ),
            Expanded(
              child: Selector<StaticsPageProv, int>(
                selector: (context, spp) => spp.page,
                shouldRebuild: (prev, next) => prev != next,
                builder: (context, model, child) {
                  switch (model) {
                    case 0:
                      return const ClassesTable();
                    case 1:
                      return const StudentsTable();
                    case 2:
                      return const TeachersTable();
                    case 3:
                      return const ClassroomsTable();
                    default:
                      return const Placeholder();
                  }
                },
              ),
            )
          ],
        ));
      },
    );
  }
}
