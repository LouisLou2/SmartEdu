import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/page/error_page.dart';
import 'package:smart_edu/state/prov/curri_prov.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/util/format_util.dart';

import '../../const/data_status.dart';
import '../../style/style_scheme.dart';
import '../widget/legend.dart';

class CurriculumPlan extends StatefulWidget {
  const CurriculumPlan({super.key});

  @override
  State<CurriculumPlan> createState() => _CirriculumPlanState();
}

class _CirriculumPlanState extends State<CurriculumPlan> {
  final CurriProv crProv = ProvManager.curriProv;

  List<Color> creditColor = [Colors.green, Colors.blue, Colors.orange, Colors.red];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(crProv.state == DataStatus.initial||crProv.state == DataStatus.failure){
        crProv.fetchCurriculum();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Selector<CurriProv, DataStatus>(
        selector: (context, prov) => prov.state,
        shouldRebuild: (pre, next) => pre != next,
        builder: (context, state, child) {
          switch (state) {
            case DataStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case DataStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case DataStatus.failure:
              return ErrorPage(onRetry: () {
                crProv.fetchCurriculum();
              });
            case DataStatus.success:
              return Padding(
                padding: EdgeInsets.only(left: 30.w, right: 5.w, top: 16.h, bottom: 16.h),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Curriculum Plan',
                                style: context.theme.textTheme.titleLarge?.copyWith(
                                  fontSize: 35.sp,
                                  fontFamily: StyleScheme.engFontFamily,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                runAlignment: WrapAlignment.center,
                                spacing: 20.w,
                                children: [
                                  Text(
                                    'For',
                                    style: context.theme.textTheme.titleLarge?.copyWith(
                                      fontSize: 35.sp,
                                      fontFamily: StyleScheme.engFontFamily,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    crProv.curriculumPlan!.majorName,
                                    style: context.theme.textTheme.titleLarge?.copyWith(
                                      fontSize: 40.sp,
                                      fontWeight: FontWeight.w400,
                                      color: context.theme.colorScheme.primary,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                                    decoration: BoxDecoration(
                                      color: context.theme.colorScheme.primary,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      '本科',
                                      style: context.textTheme.titleMedium?.copyWith(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: context.theme.colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, right: 30.w),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 300,
                                maxHeight: 300,
                              ),
                              child: GridView(
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 6,
                                ),
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: context.theme.colorScheme.outline,
                                      ),
                                      SizedBox(width: 5.w,),
                                      Text(
                                        '制定时间',
                                        style: context.theme.textTheme.titleMedium?.copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          color: context.theme.colorScheme.outline,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    FormatUtil.ymdStr(crProv.curriculumPlan!.time),
                                    style: context.theme.textTheme.titleMedium?.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: StyleScheme.engFontFamily,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.account_balance_sharp,
                                        color: context.theme.colorScheme.outline,
                                      ),
                                      SizedBox(width: 5.w,),
                                      Text(
                                        '教研组',
                                        style: context.theme.textTheme.titleMedium?.copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          color: context.theme.colorScheme.outline,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    crProv.curriculumPlan!.aaoOfficeName,
                                    style: context.theme.textTheme.titleMedium?.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.data_usage_rounded,
                                        color: context.theme.colorScheme.outline,
                                      ),
                                      SizedBox(width: 5.w,),
                                      Text(
                                        'Status',
                                        style: context.theme.textTheme.titleMedium?.copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: StyleScheme.engFontFamily,
                                          color: context.theme.colorScheme.outline,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'On Progress',
                                    style: context.theme.textTheme.titleMedium?.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: StyleScheme.engFontFamily,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                VerticalDivider(
                                  width: 1.w,
                                  thickness: 4,
                                  color: context.theme.colorScheme.primary,
                                ),
                                SizedBox(width: 20.w),
                                Wrap(
                                  direction: Axis.vertical,
                                  children: [
                                    Text(
                                      '所属院系',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      crProv.curriculumPlan!.schoolName,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: context.theme.colorScheme.primary,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    TextButton(
                                      style: ButtonStyle(
                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                      ),
                                      onPressed: (){},
                                      child: Row(
                                        children: [
                                          Text(
                                            '查看详情',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: context.theme.colorScheme.primary,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: context.theme.colorScheme.primary,
                                            size: 16.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50.w),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                VerticalDivider(
                                  width: 1.w,
                                  thickness: 4,
                                  color: context.theme.colorScheme.primary,
                                ),
                                SizedBox(width: 20.w),
                                Wrap(
                                  direction: Axis.vertical,
                                  children: [
                                    Text(
                                      '学位',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      crProv.curriculumPlan!.degreeName,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: context.theme.colorScheme.primary,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    TextButton(
                                      style: ButtonStyle(
                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                      ),
                                      onPressed: (){},
                                      child: Row(
                                        children: [
                                          Text(
                                            '查看详情',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: context.theme.colorScheme.primary,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: context.theme.colorScheme.primary,
                                            size: 16.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50.w),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                VerticalDivider(
                                  width: 1.w,
                                  thickness: 4,
                                  color: context.theme.colorScheme.primary,
                                ),
                                SizedBox(width: 20.w),
                                Wrap(
                                  direction: Axis.vertical,
                                  children: [
                                    Text(
                                      '学制',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      '${crProv.curriculumPlan!.duration}年制  时限${crProv.curriculumPlan!.maxDuration}-${crProv.curriculumPlan!.minDuration}年',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: context.theme.colorScheme.primary,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    TextButton(
                                      style: ButtonStyle(
                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                      ),
                                      onPressed: (){},
                                      child: Row(
                                        children: [
                                          Text(
                                            '查看详情',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: context.theme.colorScheme.primary,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: context.theme.colorScheme.primary,
                                            size: 16.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            VerticalDivider(
                              width: 1.w,
                              thickness: 4,
                              color: context.theme.colorScheme.primary,
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '专业简介',
                                  style: context.textTheme.headlineMedium?.copyWith(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                                  ),
                                  child: Text(
                                    crProv.curriculumPlan!.desc,
                                    style: context.textTheme.bodyMedium?.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                TextButton(
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                                  ),
                                  onPressed: (){},
                                  child: Row(
                                    children: [
                                      Text(
                                        '查看详情',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: context.theme.colorScheme.primary,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: context.theme.colorScheme.primary,
                                        size: 16.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            VerticalDivider(
                              width: 1.w,
                              thickness: 4,
                              color: context.theme.colorScheme.primary,
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '培养目标',
                                  style: context.textTheme.headlineMedium?.copyWith(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                                  ),
                                  child: Text(
                                    crProv.curriculumPlan!.target,
                                    style: context.textTheme.bodyMedium?.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                TextButton(
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                                  ),
                                  onPressed: (){},
                                  child: Row(
                                    children: [
                                      Text(
                                        '查看详情',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: context.theme.colorScheme.primary,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: context.theme.colorScheme.primary,
                                        size: 16.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            VerticalDivider(
                              width: 1.w,
                              thickness: 4,
                              color: context.theme.colorScheme.primary,
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '培养要求',
                                  style: context.textTheme.headlineMedium?.copyWith(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                                  ),
                                  child: Text(
                                    crProv.curriculumPlan!.req,
                                    style: context.textTheme.bodyMedium?.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                TextButton(
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                                  ),
                                  onPressed: (){},
                                  child: Row(
                                    children: [
                                      Text(
                                        '查看详情',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: context.theme.colorScheme.primary,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: context.theme.colorScheme.primary,
                                        size: 16.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 400.h,
                                ),
                                child: VerticalDivider(
                                  width: 1.w,
                                  thickness: 4,
                                  color: context.theme.colorScheme.primary,
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '学分要求',
                                    style: context.textTheme.headlineMedium?.copyWith(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: 300.w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
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
                                        SizedBox(height: 5.h),
                                        TextButton(
                                          style: ButtonStyle(
                                            padding: WidgetStateProperty.all(EdgeInsets.zero),
                                          ),
                                          onPressed: (){},
                                          child: Row(
                                            children: [
                                              Text(
                                                '详细要求',
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: context.theme.colorScheme.primary,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: context.theme.colorScheme.primary,
                                                size: 16.sp,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 90.w),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                VerticalDivider(
                                  width: 1.w,
                                  thickness: 4,
                                  color: context.theme.colorScheme.primary,
                                ),
                                SizedBox(width: 20.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '核心课程',
                                      style: context.textTheme.headlineMedium?.copyWith(
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '软件工程基础',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w700,
                                            color: context.theme.colorScheme.primary,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          '软件体系结构',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w700,
                                            color: context.theme.colorScheme.primary,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          '软件项目组织管理',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w700,
                                            color: context.theme.colorScheme.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.h),
                                    TextButton(
                                      style: ButtonStyle(
                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                      ),
                                      onPressed: (){},
                                      child: Row(
                                        children: [
                                          Text(
                                            '查看详情',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: context.theme.colorScheme.primary,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: context.theme.colorScheme.primary,
                                            size: 16.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
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
}