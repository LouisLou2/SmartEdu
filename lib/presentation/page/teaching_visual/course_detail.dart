import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/entity/chapter1.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/widget/leading_title.dart';
import 'package:smart_edu/style/style_scheme.dart';

import '../../../entity/chapter2.dart';
import '../../../entity/teaching_material.dart';


class CourseDetail extends StatefulWidget{
  const CourseDetail({super.key});

  @override
  State<StatefulWidget> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> with TickerProviderStateMixin{

  late final TabController _tabController;
  late final List<Chapter1> _data;
  late final List<bool> expanded;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    Chapter2 ch2 = Chapter2(
      id: 1,
      title: '1.2 有限自动机的等价性和最小化',
      content: [
        TeachingMaterial(
          fileId: 1,
          name: 'Infinitive.mp4',
          url: 'https://www.baidu.com',
          size: 1024,
          type: TeachingMaterialType.PPT,
        ),
      ]
    );
    _data = List.generate(10, (index) => Chapter1(
      id: index,
      title: 'Chapter $index',
      chapter2s: [ch2,ch2],
    ));
    expanded = List.generate(_data.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final stheme= ShadTheme.of(context);
    final mtheme= context.theme;
    return Scaffold(
      backgroundColor: mtheme.colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        leadingWidth: 200.w,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 15.w,),
              IconButton(
                icon: const Icon(
                    Icons.arrow_back_ios,
                ),
                onPressed: ()=>Navigator.pop(context),
              ),
              Image.asset(
                'assets/image/flutter_icon.png',
                fit: BoxFit.cover,
                width: 19.sp,
              ),
              SizedBox(width: 10.w,),
              Text(
                'CSU Academy',
                style: context.theme.textTheme.titleLarge?.copyWith(
                  letterSpacing: -0.5,
                  fontWeight: FontWeight.w500,
                  fontFamily: StyleScheme.engFontFamily,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(width: 10.w,),
              ShadButton.link(
                text: Text(
                  'CSU Main',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: StyleScheme.engFontFamily,
                  ),
                ),
              ),
              ShadButton.link(
                text: Text(
                  'Open Courses',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: StyleScheme.engFontFamily,
                  ),
                ),
              ),
              ShadButton.link(
                text: Text(
                  'Resources',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: StyleScheme.engFontFamily,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 300.w,
              maxHeight: 40.h,
            ),
            child:  SearchBar(
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
              backgroundColor: WidgetStatePropertyAll<Color>(context.colorScheme.secondary.withOpacity(0.1)),
              shape: const WidgetStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w,),
          ShadButton.link(
            text: Text(
              'My Courses',
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
                fontFamily: StyleScheme.engFontFamily,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              LucideIcons.calendar,
              size: 25.sp,
            ),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(
              LucideIcons.bellRing,
              size: 25.sp,
            ),
            onPressed: (){},
          ),
          SizedBox(width: 20.w,),
          CircleAvatar(
            radius: 20.sp,
            child: const Text(
              '娄',
            ),
          ),
          SizedBox(width: 18.w,),
        ],
        backgroundColor: mtheme.colorScheme.surfaceContainerHighest,
        // only bottom border
        shape: Border(
          bottom: BorderSide(
            color: mtheme.colorScheme.outlineVariant,
            width: 0.5,
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 50.w,
                right: 20.w,
                top: 20.h,
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 20.h,),
                  LeadingTitle(
                    title: 'Course Overview',
                    fontSize: 30.sp,
                  ),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.asset(
                              'assets/image/networking_course.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: AspectRatio(
                          aspectRatio: 1.5* 5/4,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 70.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h,),
                                Text(
                                  'Computer Networking',
                                  style: context.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: StyleScheme.engFontFamily,
                                    letterSpacing: -0.5,
                                    fontSize: 30.sp,
                                  ),
                                ),
                                SizedBox(height: 15.h,),
                                IntrinsicHeight(
                                  child: Container(
                                    padding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: mtheme.colorScheme.secondary.withOpacity(0.5),
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 5,
                                          ),
                                          child: AspectRatio(
                                            aspectRatio: 3,
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                maxHeight: 100.h,
                                                minWidth: 120.w,
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    LucideIcons.timer,
                                                    size: 20.sp,
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Wrap(
                                                    direction: Axis.vertical,
                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Lessons',
                                                        style: context.textTheme.bodyMedium?.copyWith(
                                                          color: mtheme.colorScheme.onSurface,
                                                          fontFamily: StyleScheme.engFontFamily,
                                                          fontSize: 13.sp,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      Text(
                                                        '16',
                                                        style: context.textTheme.bodyMedium?.copyWith(
                                                          color: mtheme.colorScheme.onSurface,
                                                          fontSize: 14.sp,
                                                          fontFamily: StyleScheme.engFontFamily,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: mtheme.colorScheme.secondary.withOpacity(0.5),
                                          thickness: 0.5,
                                          width: 1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 5,
                                          ),
                                          child: AspectRatio(
                                            aspectRatio: 3,
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                maxHeight: 100.h,
                                                minWidth: 120.w,
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.bar_chart_rounded,
                                                    size: 20.sp,
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Wrap(
                                                    direction: Axis.vertical,
                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Difficulty',
                                                        style: context.textTheme.bodyMedium?.copyWith(
                                                          color: mtheme.colorScheme.onSurface,
                                                          fontFamily: StyleScheme.engFontFamily,
                                                          fontSize: 13.sp,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Intermediate',
                                                        style: context.textTheme.bodyMedium?.copyWith(
                                                          color: mtheme.colorScheme.onSurface,
                                                          fontSize: 14.sp,
                                                          fontFamily: StyleScheme.engFontFamily,
                                                          fontWeight: FontWeight.w500,
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
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                getCourseInfoTile(LucideIcons.user, 'Max Students:', '225'),
                                SizedBox(height: 5.h,),
                                getCourseInfoTile(LucideIcons.target, 'Target Student:','Undergraduate'),
                                SizedBox(height: 5.h,),
                                getCourseInfoTile(LucideIcons.volume2, 'Language:','Chinese'),
                                SizedBox(height: 5.h,),
                                getCourseInfoTile(LucideIcons.type, 'Type:', 'Offline'),
                                SizedBox(height: 5.h,),
                                getCourseInfoTile(LucideIcons.calendar, 'Start Date:', '12 Mar 2024'),
                                SizedBox(height: 5.h,),
                                getCourseInfoTile(LucideIcons.calendar, 'End Date:', '12 Jun 2022'),
                                SizedBox(height: 5.h,),
                                getCourseInfoTile(LucideIcons.timer, 'Course Hours:', '16'),
                                const Spacer(),
                                ShadButton(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 5.w,
                                  ),
                                  text: Text(
                                    'View Syllabus',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: StyleScheme.engFontFamily,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          children: [
                            TabBar(
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              controller: _tabController,
                              labelPadding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                              ),
                              splashBorderRadius: BorderRadius.circular(10),
                              tabs: <Widget>[
                                Tab(
                                  child: Text(
                                    'Details',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: mtheme.colorScheme.onSurface,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: StyleScheme.engFontFamily,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Resources',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: mtheme.colorScheme.onSurface,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: StyleScheme.engFontFamily,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 2000.h,
                              ),
                              child: TabBarView(
                                controller: _tabController,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 20.h,),
                                        Container(
                                          padding: EdgeInsets.only(
                                            right: 20.w,
                                            left: 20.w,
                                            top: 20.h,
                                            bottom: 15.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: mtheme.colorScheme.secondary.withOpacity(0.05),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '编译原理是计算机、软件专业设置的一门专业基础核心课程。和操作系统一样，编译系统是计算机关键基础软件，是程序员与计算机之间的接口。编译原理是一个优秀程序员应掌握的专业基础知识。该课程将为学生在理论、技术、方法等方面提供系统而有效的训练，有利于提高计算机、软件人员的素质和能力。',
                                                softWrap: true,
                                              ),
                                              SizedBox(height: 20.h,),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  '——MESSAGE FROM THE INSTRUCTOR',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: mtheme.colorScheme.onSurfaceVariant,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: StyleScheme.engFontFamily,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 30.h,),
                                        Divider(
                                          color: mtheme.colorScheme.secondary.withOpacity(0.5),
                                          thickness: 0.5,
                                        ),
                                        Text(
                                          'OVERVIEW',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            color: mtheme.colorScheme.onSurfaceVariant,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: StyleScheme.engFontFamily,
                                          ),
                                        ),
                                        SizedBox(height: 15.h,),
                                        Text(
                                          '本课程旨在系统地向学生讲述编译程序的结构及其各组成部分的设计原理与实现技术，使学生掌握编译程序的基本原理、方法和实现技术，更好的理解程序语言的内部机制、理解计算机软硬件系统的基本架构与工作原理，培养学生设计、实现和分析简单编译软件的能力，并能在思维素质方面得到拓展提高，进一步理解计算机学科中解决问题的思路方法。课程主要讲授：自动机与形式语言基础；词法分析；语法分析；语法制翻译与中间代码生成；中间代码优化等。\n本课程2009年被评为国家精品课程，2013年被评为国家精品资源共享课程。',
                                          softWrap: true,
                                          style: mtheme.textTheme.titleMedium?.copyWith(
                                            color: mtheme.colorScheme.secondary,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 30.h,),
                                        Divider(
                                          color: mtheme.colorScheme.secondary.withOpacity(0.5),
                                          thickness: 0.5,
                                        ),
                                        Text(
                                          'TARGET',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            color: mtheme.colorScheme.onSurfaceVariant,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: StyleScheme.engFontFamily,
                                          ),
                                        ),
                                        SizedBox(height: 15.h,),
                                        Text(
                                          '本课程旨在系统地向学生讲述编译程序的结构及其各组成部分的设计原理与实现技术，使学生掌握编译程序的基本原理、方法和实现技术，更好的理解程序语言的内部机制、理解计算机软硬件系统的基本架构与工作原理，培养学生设计、实现和分析简单编译软件的能力，并能在思维素质方面得到拓展提高，进一步理解计算机学科中解决问题的思路方法。课程主要讲授：自动机与形式语言基础；词法分析；语法分析；语法制翻译与中间代码生成；中间代码优化等。\n本课程2009年被评为国家精品课程，2013年被评为国家精品资源共享课程。',
                                          softWrap: true,
                                          style: mtheme.textTheme.titleMedium?.copyWith(
                                            color: mtheme.colorScheme.secondary,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 30.h,),
                                        Divider(
                                          color: mtheme.colorScheme.secondary.withOpacity(0.5),
                                          thickness: 0.5,
                                        ),
                                        Text(
                                          'PREREQUISITES',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            color: mtheme.colorScheme.onSurfaceVariant,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: StyleScheme.engFontFamily,
                                          ),
                                        ),
                                        SizedBox(height: 15.h,),
                                        Text(
                                          '掌握计算机程序设计语言和程序设计知识，了解微机原理、组成原理、数据结构、离散数学以及操作系统等知识。',
                                          softWrap: true,
                                          style: mtheme.textTheme.titleMedium?.copyWith(
                                            color: mtheme.colorScheme.secondary,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height: 20.h,),
                                      SingleChildScrollView(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: mtheme.colorScheme.secondary.withOpacity(0.05),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20.w,
                                            vertical: 20.h,
                                          ),
                                          child: ExpansionPanelList(
                                            expandedHeaderPadding: EdgeInsets.symmetric(vertical: 10.h),
                                            materialGapSize: 10,
                                            elevation: 0,
                                            expansionCallback: (int index, bool isExpanded) {
                                              setState(() {
                                                print('index: $index, isExpanded: $isExpanded');
                                                expanded[index] = isExpanded;
                                              });
                                            },
                                            children: List.generate(_data.length, (index)=>index).map<ExpansionPanel>((int ch1) {
                                              return ExpansionPanel(
                                                canTapOnHeader: true,
                                                backgroundColor: Colors.transparent,
                                                isExpanded: expanded[ch1],
                                                headerBuilder: (BuildContext context, bool isExpanded) {
                                                  return ListTile(
                                                    tileColor: mtheme.colorScheme.surfaceContainerHighest,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    title: Text(
                                                      _data[ch1].title,
                                                      style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color: mtheme.colorScheme.onSurface,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: StyleScheme.engFontFamily,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                body: Builder(
                                                  builder: (BuildContext context){
                                                    List<Widget> children = [];
                                                    List<Chapter2> ch2 = _data[ch1].chapter2s;
                                                    for(int i=0;i < ch2.length; ++i){
                                                      children.add(
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(
                                                            vertical: 5.h,
                                                            horizontal: 10.w,
                                                          ),
                                                          child: Text(
                                                            ch2[i].title,
                                                            style: mtheme.textTheme.titleMedium?.copyWith(
                                                              color: mtheme.colorScheme.onSurfaceVariant,
                                                              fontSize: 16.sp,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                      for(int j=0;j < ch2[i].content.length; ++j){
                                                        children.add(
                                                          ListTile(
                                                            contentPadding: EdgeInsets.symmetric(
                                                              horizontal: 40.w,
                                                            ),
                                                            leading: Icon(
                                                              Icons.file_present,
                                                              size: 20.sp,
                                                            ),
                                                            title: Text(
                                                              ch2[i].content[j].name,
                                                              style: mtheme.textTheme.titleMedium?.copyWith(
                                                                color: mtheme.colorScheme.onSurfaceVariant,
                                                                fontSize: 14.sp,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                            trailing: TextButton(
                                                              onPressed: (){},
                                                              child: Text(
                                                                'Download',
                                                                style: TextStyle(
                                                                  fontSize: 14.sp,
                                                                  color: mtheme.colorScheme.primary,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontFamily: StyleScheme.engFontFamily,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      children.add(SizedBox(height: 10.h,));
                                                    }
                                                    return Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: children,
                                                    );
                                                  },
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 40.h,
                            left: 30.w,
                            right: 20.w,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: mtheme.colorScheme.secondary.withOpacity(0.04),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  tileColor: mtheme.colorScheme.surfaceContainerHighest,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: 0,
                                  ),
                                  title: Text(
                                    'Teacher Team',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: mtheme.colorScheme.onSurface,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.5,
                                      fontFamily: StyleScheme.engFontFamily,
                                    ),
                                  ),
                                ),
                                ...List.generate(5, (index)=>
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: CircleAvatar(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: Image.asset('assets/image/aao_admin.png'),
                                        ),
                                      ),
                                      title: Text(
                                        '卡洛琳',
                                        style: mtheme.textTheme.titleMedium?.copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      subtitle: Text(
                                        '副教授',
                                        style: mtheme.textTheme.titleMedium?.copyWith(
                                          fontSize: 13.sp,
                                          color: context.theme.colorScheme.onSurface.withOpacity(0.6),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCourseInfoTile(IconData icon, String title, String value){
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10.w,
      children: [
        Icon(
          icon,
          size: 17.sp,
        ),
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            fontFamily: StyleScheme.engFontFamily,
            fontSize: 14.sp,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(
            fontFamily: StyleScheme.engFontFamily,
            fontSize: 16.sp,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}