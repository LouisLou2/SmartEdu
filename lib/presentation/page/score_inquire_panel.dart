import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/page/score_inquire.dart';

import '../../style/style_scheme.dart';

class ScoreInquirePanel extends StatefulWidget {

  const ScoreInquirePanel({super.key});

  @override
  State<ScoreInquirePanel> createState() => _ScoreInquirePanelState();
}

class _ScoreInquirePanelState extends State<ScoreInquirePanel> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 16.h),
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
                      contentPadding: EdgeInsets.only(left: 8.w, right: 20.w, top: 0, bottom: 0),
                      horizontalTitleGap: 10.w,
                      leading: const Icon(Icons.school),
                      title: Text(
                        '我的成绩',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onTap: (){},
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ListTile(
                        minTileHeight: 0,
                        selected: true,
                        titleAlignment: ListTileTitleAlignment.center,
                        horizontalTitleGap: 6.w,
                        contentPadding: EdgeInsets.only(left: 8.w, right: 20.w, top: 0, bottom: 0),
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                      child: ListTile(
                        minTileHeight: 0,
                        horizontalTitleGap: 6.w,
                        contentPadding: EdgeInsets.only(left: 8.w, right: 20.w, top: 0, bottom: 0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        leading: Icon(
                          Icons.table_chart_outlined,
                          size: 18.sp,
                        ),
                        title: Text(
                          '学期理论课表',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.3,
                          ),
                        ),
                        onTap: (){},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ListTile(
                        minTileHeight: 0,
                        horizontalTitleGap: 6.w,
                        contentPadding: EdgeInsets.only(left: 8.w, right: 20.w, top: 0, bottom: 0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        leading: Icon(
                          Icons.table_chart_outlined,
                          size: 18.sp,
                        ),
                        title: Text(
                          '学期理论课表',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.3,
                          ),
                        ),
                        onTap: (){},
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
          SizedBox(
            width: 40.w,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 20.h, bottom: 10.h),
                  child: Text(
                    'Score Inquire',
                    style: context.theme.textTheme.titleLarge?.copyWith(
                      fontSize: 35.sp,
                      fontFamily: StyleScheme.engFontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Expanded(
                  child: ScoreInquire(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}