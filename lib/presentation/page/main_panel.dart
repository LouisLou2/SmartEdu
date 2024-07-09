import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/entity/chart_data.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/widget/activity_tile.dart';
import 'package:smart_edu/presentation/widget/card_header.dart';
import 'package:smart_edu/presentation/widget/legend.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/util/format_util.dart';
import 'package:time_planner/time_planner.dart';

import '../../entity/activity.dart';

class MainPanel extends StatefulWidget{
  const MainPanel({super.key});

  @override
  State<StatefulWidget> createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {

  List<Color> creditColor=[Colors.green, Colors.blue, Colors.orange, Colors.red];
  List<Activity> activities = [
    Activity(eventId: 1, title: '培养方案变更提醒', time: DateTime.now()),
    Activity(eventId: 2, title: '2024年上学期教学评价', time: DateTime.now()),
    Activity(eventId: 3, title: '缓考申请启动', time: DateTime.now()),
    Activity(eventId: 4, title: '6月份出勤报表已生成', time: DateTime.now()),
  ];

  ChartData cdata=ChartData.term(
    year: 2024,
    term: TimeScale.TERM,
    xList: [2,3,4,5,6],
    yList: [0.9, 0.7, 0.85, 0.5, 0.8],
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 15.w,),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.h, left: 15.w),
                  child: Wrap(
                    spacing: 10.w,
                    children: [
                      Icon(
                        Icons.waving_hand,
                        size: 30.sp,
                        color: context.theme.colorScheme.primary,
                      ),
                      Text(
                        "Welcome, ",
                        style: context.theme.textTheme.titleLarge?.copyWith(
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.w500,
                          fontFamily: StyleScheme.engFontFamily,
                        ),
                      ),
                      Text(
                        "李华",
                        style: context.theme.textTheme.titleLarge?.copyWith(
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.w700,
                          color: context.theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, left: 15.w, bottom: 30.h),
                      child: Text(
                        "What's Going On ?",
                        style: context.theme.textTheme.headlineLarge?.copyWith(
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.w500,
                          fontFamily: StyleScheme.engFontFamily,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, right: 15.w, bottom: 30.h),
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                          backgroundColor: context.theme.colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: context.theme.colorScheme.onPrimary,
                              size: 20.sp,
                            ),
                            Text(
                              'More',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: context.theme.colorScheme.onPrimary,
                                fontFamily: StyleScheme.engFontFamily,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 600.w,
                      ),
                      child: ShadTabs<int>(
                        defaultValue: 1,
                        tabBarConstraints: const BoxConstraints(maxWidth: 400),
                        contentConstraints: const BoxConstraints(maxWidth: 400),
                        tabs: [
                          ShadTab(
                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5.h),
                            value: 1,
                            text: Text('校内活动',style: context.theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),),
                            content: ShadCard(
                              padding: EdgeInsets.only(top: 2.h, left: 10.w, right: 10.w, bottom: 15.h),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CardHeader(
                                    title: '校内活动',
                                    trailingMore: 'More',
                                    onTap: (){},
                                    titleFontSize: 18.w,
                                  ),
                                  ...List.generate(activities.length, (index)=>
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: ActivityTile(activity: activities[index], onTap: (){},
                                        ),
                                      ),
                                  ),
                                  SizedBox(height: 5.h),
                                ],
                              ),
                            ),
                          ),
                          ShadTab(
                            value: 2,
                            text: Text('我的学业', style: context.theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),),
                            content: ShadCard(
                              padding: EdgeInsets.only(top: 2.h, left: 10.w, right: 10.w, bottom: 15.h),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CardHeader(
                                    title: '我的学业',
                                    trailingMore: 'More',
                                    onTap: (){},
                                  ),
                                  ...List.generate(activities.length, (index)=>
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: ActivityTile(activity: activities[index], onTap: (){},
                                        ),
                                      ),
                                  ),
                                  SizedBox(height: 5.h),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Expanded(
                      child: ShadCard(
                        padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 15.h,top: 10.h),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardHeader(
                              title: 'Attendance Rate',
                              trailingMore: 'More',
                              onTap: (){},
                              titleFontSize: 22.sp,
                              titleFontFamily: StyleScheme.engFontFamily,
                              titleFontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10.h,),
                            getChart(cdata),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w,),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h, left: 15.w, bottom: 15.h),
                  child: Text(
                    'My Schedule',
                    style: context.theme.textTheme.headlineMedium?.copyWith(
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w500,
                      fontFamily: StyleScheme.engFontFamily,
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 500.h,
                  ),
                  child: getCourseSchedule(),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                ),
                constraints: BoxConstraints(
                  maxWidth: 300.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.h,),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context.theme.colorScheme.primary,
                          width: 2.sp,
                        ),
                        image:  const DecorationImage(
                          image: AssetImage('assets/image/stu.png'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: context.theme.colorScheme.primary.withOpacity(0.4),
                            blurRadius: 5.sp,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      constraints: BoxConstraints(
                        maxWidth: 100.w,
                        maxHeight: 100.w,
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Align(
                      child: Text(
                        '李华',
                        style: context.theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    Align(
                      child: Text(
                        '2022 软件工程',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My Credits',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: StyleScheme.engFontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Align(
                      child: getRadialChart(
                        [0.25, 0.5, 0.75, 0.9],
                        [Colors.green, Colors.blue, Colors.orange, Colors.red],
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.w,
                        mainAxisSpacing: 5.h,
                        childAspectRatio: 2.5,
                      ),
                      children: List.generate(4, (index) => Legend(
                        color: creditColor[index],
                        desc: '必修 70/170',
                        radius: 5.w,
                      )),
                    ),
                    SizedBox(height: 20.h,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            '详细学业进展',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: context.theme.colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.sp,
                            color: context.theme.colorScheme.primary,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Upcoming Tasks',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: StyleScheme.engFontFamily,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Material(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 10.w),
                        tileColor: context.theme.colorScheme.onInverseSurface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        title: Text(
                          '本学期教学评价启动',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          '2024-06-23',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.sp,
                          color: context.theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Material(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 10.w),
                        tileColor: context.theme.colorScheme.onInverseSurface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        title: Text(
                          '重修课程费用缴纳',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          '2024-06-23',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.sp,
                          color: context.theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
          )
        ],
      ),
    );
  }
  // 固定是四个value
  Widget getRadialChart(List<double> values, List<Color> colors){
    int len = values.length;
    double radius = 30.w;
    double lineW = 12.w;
    Color backColor =  context.theme.colorScheme.primary.withOpacity(0.2);
    CircularPercentIndicator indicator= CircularPercentIndicator(
      radius: radius,
      lineWidth: lineW,
      circularStrokeCap: CircularStrokeCap.round,
      percent: values[len-1],
      progressColor: colors[len-1],
      backgroundColor: backColor,
      animation: true,
      animationDuration: 400,
    );
    for(int i = values.length-2; i>=0; --i){
      radius += 18.w;
      indicator = CircularPercentIndicator(
        radius: radius,
        lineWidth: lineW,
        circularStrokeCap: CircularStrokeCap.round,
        percent: values[i],
        center: indicator,
        progressColor: colors[i],
        backgroundColor: backColor,
        animation: true,
        animationDuration: 400,
      );
    }
    return indicator;
  }

  Widget getCourseSchedule(){
    return TimePlanner(
      startHour: 8,
      endHour: 22,
      headers: [
        TimePlannerTitle(title: 'Mon'),
        TimePlannerTitle(title: 'Tue'),
        TimePlannerTitle(title: 'Wed'),
        TimePlannerTitle(title: 'Thu'),
        TimePlannerTitle(title: 'Fri'),
        TimePlannerTitle(title: 'Sat'),
      ],
      tasks: [
        TimePlannerTask(
          // background color for task
          color: Colors.purple,
          // day: Index of header, hour: Task will be begin at this hour
          // minutes: Task will be begin at this minutes
          dateTime: TimePlannerDateTime(day: 0, hour: 14, minutes: 30),
          // Minutes duration of task
          minutesDuration: 90,
          // Days duration of task (use for multi days task)
          daysDuration: 1,
          onTap: () {},
          child: Text(
            'this is a task',
            style: TextStyle(color: Colors.grey[350], fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget getChart(ChartData data){
    return AspectRatio(
      aspectRatio: 1.75,
      child: LineChart(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        LineChartData(
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(
                color: context.theme.colorScheme.primary.withOpacity(0.3),
                width: 1.sp,
              ),
              left: BorderSide(
                color: context.theme.colorScheme.primary.withOpacity(0.3),
                width: 1.sp,
              ),
              right: BorderSide.none,
              top: BorderSide.none,
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              barWidth: 6.sp,
              spots: List.generate(data.xList.length, (index)=>FlSpot(data.xList[index].toDouble(), data.yList[index],),),
              gradient: const LinearGradient(
                colors: [Colors.indigoAccent, Colors.blue, Colors.green],
              ),
              isCurved: true,
              isStrokeCapRound: true,
              isStrokeJoinRound: true,
              preventCurveOverShooting: true,
              shadow: Shadow(
                color: context.theme.colorScheme.primary.withOpacity(0.3),
                blurRadius: 5,
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (LineBarSpot touchedSpot){
                return context.theme.colorScheme.primary;
              },
              getTooltipItems: (List<LineBarSpot> touchedSpots){
                return touchedSpots.map((LineBarSpot touchedSpot){
                  return LineTooltipItem(
                    FormatUtil.doubleToStr(touchedSpot.y),
                    TextStyle(
                      color: context.theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                      fontFamily: StyleScheme.engFontFamily,
                      fontSize: 12.sp,
                    ),
                  );
                }).toList();
              },
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: true,
            horizontalInterval: 0.1,
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) => FlLine(
              color: context.theme.colorScheme.primary.withOpacity(0.3),
              strokeWidth: 1.sp,
            ),
            getDrawingVerticalLine: (value) => FlLine(
              color: context.theme.colorScheme.primary.withOpacity(0.3),
              strokeWidth: 1.sp,
            ),
          ),
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 0.1,
                getTitlesWidget: (value, meta){
                  return Text(
                    FormatUtil.doubleToStr(value),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: StyleScheme.engFontFamily,
                      color: context.theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value,meta){
                  return Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Text(
                      'Jan',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: StyleScheme.engFontFamily,
                        color: context.theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ),
      ),
    );
  }
}