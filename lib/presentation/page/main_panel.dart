import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/util/format_util.dart';

class MainPanel extends StatefulWidget {
  const MainPanel({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.h, left: 15.w, bottom: 15.h),
                  child: Text(
                    'My Credits',
                    style: context.theme.textTheme.headlineMedium?.copyWith(
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w500,
                      fontFamily: StyleScheme.engFontFamily,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: getPercentCard(170, 50, '必修'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: getPercentCard(50, 30.5, '选修'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: getPercentCard(10, 4, '课外'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: getPercentCard(4, 2, '任选'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 0),
            child: SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surface,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          size: 30.sp,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            '李华',
                            style: context.theme.textTheme.titleLarge
                                ?.copyWith(letterSpacing: -0.5),
                          ),
                          Text(
                            '8209220140',
                            style:
                                context.theme.textTheme.titleMedium?.copyWith(
                              color: context.theme.colorScheme.onSurface
                                  .withOpacity(0.6),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }

  Widget getPercentCard(double all, double now, String name) {
    return ShadCard(
      padding:
          EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w, bottom: 15.h),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                direction: Axis.vertical,
                children: [
                  Text(
                    name,
                    style: context.theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        '$now/',
                        style: context.theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontFamily: StyleScheme.engFontFamily,
                          color: context.theme.colorScheme.primary,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        '$all',
                        style: context.theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontFamily: StyleScheme.engFontFamily,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                '已完成',
                style: context.theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontFamily: StyleScheme.engFontFamily,
                  fontSize: 15.w,
                  color: context.theme.colorScheme.primary.withOpacity(0.7),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          CircularPercentIndicator(
            radius: 42.w,
            lineWidth: 12.sp,
            circularStrokeCap: CircularStrokeCap.round,
            percent: now / all,
            center: Text(
              FormatUtil.getPercent(now / all),
              style: context.theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            progressColor: context.theme.colorScheme.primary,
            backgroundColor: context.theme.colorScheme.primary.withOpacity(0.2),
            animation: true,
            animationDuration: 400,
          ),
        ],
      ),
    );
  }
}
