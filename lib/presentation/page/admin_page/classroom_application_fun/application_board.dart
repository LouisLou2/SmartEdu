import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/domain/entity/classroom_apply_datas.dart';
import 'package:smart_edu/presentation/page/admin_page/classroom_application_fun/classroom_apply.dart';
import 'package:smart_edu/presentation/page/admin_page/classroom_repair_fun/malfunction_repair.dart';
import 'package:smart_edu/state/statics_page_prov.dart';

class ApplicationBoard extends StatefulWidget {
  const ApplicationBoard({Key? key}) : super(key: key);

  @override
  _ApplicationBoardState createState() => _ApplicationBoardState();
}

class _ApplicationBoardState extends State<ApplicationBoard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StaticsPageProv>(
      builder: (context, model, child) {
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
                          '审批处理',
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
                          selected: model.repairPage == 0,
                          titleAlignment: ListTileTitleAlignment.center,
                          horizontalTitleGap: 6.w,
                          contentPadding: EdgeInsets.only(
                              left: 8.w, right: 20.w, top: 0, bottom: 0),
                          selectedTileColor: context.theme.colorScheme.primary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          leading: Icon(
                            Icons.table_chart_outlined,
                            size: 18.sp,
                            color: model.repairPage == 0
                                ? context.theme.colorScheme.onPrimary
                                : context.theme.colorScheme.secondary,
                          ),
                          title: Text(
                            '维修审批',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.3,
                              color: model.repairPage == 0
                                  ? context.theme.colorScheme.onPrimary
                                  : context.theme.colorScheme.secondary,
                            ),
                          ),
                          onTap: () {
                            Provider.of<StaticsPageProv>(context, listen: false)
                                .setRepairPage(0);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: ListTile(
                          minTileHeight: 0,
                          selected: model.repairPage == 1,
                          titleAlignment: ListTileTitleAlignment.center,
                          horizontalTitleGap: 6.w,
                          contentPadding: EdgeInsets.only(
                              left: 8.w, right: 20.w, top: 0, bottom: 0),
                          selectedTileColor: context.theme.colorScheme.primary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          leading: Icon(
                            Icons.table_chart_outlined,
                            size: 18.sp,
                            color: model.repairPage == 1
                                ? context.theme.colorScheme.onPrimary
                                : context.theme.colorScheme.secondary,
                          ),
                          title: Text(
                            '教室审批',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.3,
                              color: model.repairPage == 1
                                  ? context.theme.colorScheme.onPrimary
                                  : context.theme.colorScheme.secondary,
                            ),
                          ),
                          onTap: () {
                            Provider.of<StaticsPageProv>(context, listen: false)
                                .setRepairPage(1);
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
              child: Consumer<StaticsPageProv>(
                builder: (context, model, child) {
                  switch (model.repairPage) {
                    case 0:
                      return const MalfunctionRepair();
                    case 1:
                      return const ClassroomList();
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
