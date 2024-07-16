import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_edu/extension/context_extension.dart';

import '../../style/style_scheme.dart';
import '../widget/legend.dart';

class CurriculumPlan extends StatefulWidget {
  const CurriculumPlan({super.key});

  @override
  State<CurriculumPlan> createState() => _CirriculumPlanState();
}

class _CirriculumPlanState extends State<CurriculumPlan> {

  List<Color> creditColor = [Colors.green, Colors.blue, Colors.orange, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 16.h),
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
          Expanded(
            child: Padding(
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
                                  '软件工程',
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
                                  '5 March 2024',
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
                                  '软件工程教研组',
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
                                    '中南大学计算机学院',
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
                                    '工学学位',
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
                                    '4年制  时限3-6年',
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
                                  '软件工程专业培养学生运用工程的概念、原理、技术和方法对大规模复杂软件系统进行开发、应用、维护和管理的能力。是教育部首批实施“卓越工程师教育培养计划”专业和湖南省特色专业。学院是“国家示范性软件学院”，是首批国家工程实践教育中心建设单位。师资队伍由学院专职教师以及国内外著名高校科研院所学者、著名企业高级工程师和管理人员组成。坚持“国际化、工程化、高层次、复合型”办学理念，以国民经济建设和社会信息化需求为导向，以新工科工程教育模式为指导，培养具有实干担当精神和行业领军能力的高级软件工程人才。',
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
                                  '软件工程专业主要研究软件开发方法、技术、工具及质量管理等内容，借助于计算机科学、数学、管理科学等诸多学科的知识，有效地解决软件开发及应用过程中的问题。本专业以国民经济和社会信息化需求为导向，以构思、设计、实施和运行实际工程为工程教育背景环境，结合新工科工程教育模式，培养具有一定的人文道德素质和实干担当精神，拥有良好团队协作意识和国际视野，软件理论基础知识扎实，能综合运用专业知识分析和解决实际软件工程问题，具有软件产业实践经验，适应现代化工程团队、新产品和新系统开发需求，能依据工程需要自发学习并优化自身理论知识体系，拥有较强创新创业能力的高级软件工程人才。',
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
                                  '软件工程专业培养要求：要求学生系统掌握本专业的基础理论和专业知识，参加由具有软件工程实践经验的导师与软件企业中业务水平高的工程师联合指导的工程实践；要求学生具备软件工程项目的开发、管理和协调能力；注重工程实践能力、组织管理能力和创新创业能力培养。对毕业生在知识、能力与素质方面的具体要求如下：\n1.知识要求\n①软件工程基础理论知识：掌握软件工程相关的基本理论和基础专业知识，具备从事软件工程工作所需的相关数学、自然科学和人文社科知识。包括：具有解决复杂软件工程问题的数学、自然科学和人文社科知识结构;具有工程基础和软件工程基础知识;具有合理的软件工程专业知识结构;能够运用数学、自然科学、工程基础和专业知识解决复杂软件工程问题。',
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
            ),
          ),
        ],
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