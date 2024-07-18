import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/entity/tuple2.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/widget/text_list.dart';
import 'package:smart_edu/state/prov/course_sched_prov.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:time_planner/time_planner.dart';

import '../../const/business_const.dart';
import '../../data/basic_data.dart';
import '../../entity/general/option_section.dart';
import '../../entity/term.dart';
import '../../style/style_scheme.dart';

class CourseSched extends StatefulWidget{
  const CourseSched({super.key});

  @override
  State<CourseSched> createState() => _CourseSchedState();
}

class _CourseSchedState extends State<CourseSched>{
  final CourseSchedProv coProv = ProvManager.courseSchedProv;
  late List<Term> termList;
  late OptionSection YtOptions;
  late OptionSection WOptions;

  @override
  void initState(){
    setYearTermSection();
    YtOptions = OptionSection.fromTerm(termList);
    WOptions = OptionSection.fromWeek(BusinessConst.weeksPerTerm);
    super.initState();
    // 在initState中加载数据
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      coProv.fetchTasks(isDefault: true);
    });
  }

  void setYearTermSection(){
    int yearFrom = BasicData.earliestTermYear;
    int yearTo = BasicData.nowYear;
    termList = [];
    for(int i = yearTo;i>=yearFrom;--i){
      termList.add(Term(year: i, term: true,));
      termList.add(Term(year: i, term: false,));
    }
  }

  Tuple2<int,bool> getYearTerm(int index){
    int year = termList[index].year;
    bool term = termList[index].term;
    return Tuple2<int,bool>(year,term);
  }

  @override
  Widget build(BuildContext context){
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
                      horizontalTitleGap: 6.w,
                      leading: const Icon(Icons.schedule),
                      title: Text(
                        '我的课表',
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
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 10.h),
                  child: Text(
                    'My Schedule',
                    style: context.theme.textTheme.titleLarge?.copyWith(
                      fontSize: 35.sp,
                      fontFamily: StyleScheme.engFontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
                  child: Row(
                    children: [
                      ShadSelect<Tuple2<int,int>>(
                        placeholder: Text(
                          '选择学期',
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        initialValue: Tuple2<int,int>(0,0),
                        options: getTextList([YtOptions], context,),
                        onChanged: (value) {
                          print('@@@@@@@@@@@@@@$value');
                          final yt = getYearTerm(value.item2);
                          coProv.setYearTerm(yt.item1,yt.item2);
                        },
                        selectedOptionBuilder: (BuildContext context, Tuple2<int, int> value) {
                          return Text(
                            YtOptions.options[value.item2],
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                      ShadSelect<Tuple2<int,int>>(
                        placeholder: Text(
                          '选择周',
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        initialValue: Tuple2<int,int>(0,0),
                        options: getTextList([WOptions], context,),
                        onChanged: (value) {
                          print('@@@@@@@@@@@@@@$value');
                          coProv.setWeek(value.item2+1);// 从1开始
                        },
                        selectedOptionBuilder: (BuildContext context, Tuple2<int, int> value) {
                          return Text(
                            WOptions.options[value.item2],
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                      OutlinedButton(
                        onPressed: (){
                          coProv.fetchTasks(isDefault: false);
                        },
                        child: Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child:  Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 60.w),
                    child: Selector<CourseSchedProv, String>(
                      selector: (context, prov) => prov.timeStrKey,
                      shouldRebuild: (prev, next) => prev != next,
                      builder: (context, _, child) {
                        return getCourseSchedule(coProv.tasks);
                      },
                    ),
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget getCourseSchedule(List<TimePlannerTask> tasks1){
    return TimePlanner(
      setTimeOnAxis: false,
      style: TimePlannerStyle(
        cellHeight: (50.h).toInt(),
        cellWidth: (150.w).toInt(),
      ),
      startHour: 8,
      endHour: 21,
      headers: [
        TimePlannerTitle(
          title: 'Mon',
          titleStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
        ),
        TimePlannerTitle(title: 'Tue',
          titleStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
        ),
        TimePlannerTitle(title: 'Wed',
          titleStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
        ),
        TimePlannerTitle(title: 'Thu',
          titleStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
        ),
        TimePlannerTitle(title: 'Fri',
          titleStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
        ),
        TimePlannerTitle(title: 'Sat',
          titleStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
        ),
      ],
      tasks: tasks1,
    );
  }
}