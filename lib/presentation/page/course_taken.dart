import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/entity/chapter1.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/style/style_scheme.dart';

import '../widget/legend.dart';


class CourseTaken extends StatefulWidget{
  const CourseTaken({super.key});

  @override
  State<StatefulWidget> createState() => _CourseTakenState();
}

class _CourseTakenState extends State<CourseTaken> with TickerProviderStateMixin{

  late final TabController _tabController;
  late final List<Chapter1> _data;
  late final List<bool> expanded;
  List<Color> creditColor=[Colors.green, Colors.blue, Colors.orange, Colors.red];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final stheme= ShadTheme.of(context);
    final mtheme= context.theme;
    return Scaffold(
      backgroundColor: mtheme.colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
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
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(left: 5.w, right: 0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                      Text(
                        '2022 软件工程',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.grey,
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
                ),
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Padding(
              padding: EdgeInsets.only(left: 5.w, top: 10.h),
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  border: Border.all(
                    color: context.theme.colorScheme.outlineVariant,
                    width: 0.5,
                  ),
                ),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 30.w,
                              maxHeight: 32.h,
                            ),
                            child: IconButton.outlined(
                              color: context.theme.colorScheme.outline,
                              icon: Icon(
                                Icons.arrow_back,
                                size: 18.sp,
                              ),
                              style: IconButton.styleFrom(
                                side: BorderSide(
                                  color: context.theme.colorScheme.outlineVariant,
                                  width: 1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(3.sp),
                              ),
                              onPressed: () {  },
                            ),
                          ),
                          SizedBox(width: 15.w,),
                          Text(
                            'My Courses',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.5,
                              fontFamily: StyleScheme.engFontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: context.theme.colorScheme.outlineVariant,
                      thickness: 0.5,
                      height: 0.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 50.w,
                        top: 20.h,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage('assets/image/bg1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tell Us How To Improve',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: StyleScheme.engFontFamily,
                              ),
                            ),
                            Text(
                              'Your feedback is important to us. Please take a moment to fill out the survey on the system',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: StyleScheme.engFontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      child: TabBar(
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        controller: _tabController,
                        indicatorPadding: const EdgeInsets.symmetric(vertical: 0),
                        indicatorColor: context.theme.colorScheme.onSurface,
                        unselectedLabelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: StyleScheme.engFontFamily,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: StyleScheme.engFontFamily,
                          color: context.theme.colorScheme.onSurface,
                        ),
                        unselectedLabelColor: context.theme.colorScheme.outline.withOpacity(0.9),
                        tabs: const [
                          Tab(
                            text: 'All Course',
                          ),
                          Tab(
                            text: 'Required Course',
                          ),
                          Tab(
                            text: 'Elective Course',
                          ),
                        ],
                      ),
                    ),
                    ...List.generate(5,
                        (index)=> Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            right: 40.w,
                            top: 15.h,
                            bottom: 15.h,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.theme.colorScheme.surface,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(
                                color: context.theme.colorScheme.outlineVariant,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      Text(
                                        '#42543 - ',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          letterSpacing: -0.5,
                                          fontWeight: FontWeight.w400,
                                          color: context.theme.colorScheme.outline,
                                          fontFamily: StyleScheme.engFontFamily,
                                        ),
                                      ),
                                      Text(
                                        ' Computer Networking',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          letterSpacing: -0.5,
                                          wordSpacing: 1.5,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: StyleScheme.engFontFamily,
                                        ),
                                      ),
                                      SizedBox(width: 10.w,),
                                      Chip(
                                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                                        surfaceTintColor: Colors.transparent,
                                        side: const BorderSide(
                                          color: Color(0xff4e34d4),
                                          width: 1,
                                        ),
                                        label: Text(
                                          'Major Fundamental',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff4e34d4),
                                            fontFamily: StyleScheme.engFontFamily,
                                          ),
                                        ),
                                        backgroundColor: const Color(0xff4e34d4).withOpacity(0.1),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 20.w,
                                    right: 20.w,
                                    bottom: 15.h,
                                  ),
                                  child: Text(
                                    'Computer networking refers to the practice of interconnecting multiple computing devices to share resources, exchange data, and communicate. Networks can be small, like a local area network (LAN) within a single building, or large, spanning vast distances like...',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      letterSpacing: -0.5,
                                      wordSpacing: 1.2,
                                      fontWeight: FontWeight.w400,
                                      color: context.theme.colorScheme.outline.withOpacity(0.9),
                                      fontFamily: StyleScheme.engFontFamily,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: context.theme.colorScheme.outlineVariant,
                                  thickness: 0.5,
                                  height: 0.5.h,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                                  color: context.theme.colorScheme.surfaceContainerHigh,
                                  child: Row(
                                    children: [
                                      Chip(
                                        avatar: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            LucideIcons.timer,
                                            color: context.theme.colorScheme.outline,
                                            size: 20.sp,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                                        labelPadding: const EdgeInsets.only(right: 5),
                                        surfaceTintColor: Colors.transparent,
                                        side: BorderSide(
                                          color: context.theme.colorScheme.outlineVariant,
                                          width: 1,
                                        ),
                                        label: Wrap(
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          spacing: 5,
                                          children: [
                                            Text(
                                              'Course Hours',
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                                color: context.theme.colorScheme.outline,
                                                fontFamily: StyleScheme.engFontFamily,
                                              ),
                                            ),
                                            Text(
                                              '18',
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: StyleScheme.engFontFamily,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 15.w,),
                                      Chip(
                                        avatar: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            LucideIcons.award,
                                            color: context.theme.colorScheme.outline,
                                            size: 20.sp,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                                        labelPadding: const EdgeInsets.only(right: 5),
                                        surfaceTintColor: Colors.transparent,
                                        side: BorderSide(
                                          color: context.theme.colorScheme.outlineVariant,
                                          width: 1,
                                        ),
                                        label: Wrap(
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          spacing: 5,
                                          children: [
                                            Text(
                                              'Credit',
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                                color: context.theme.colorScheme.outline,
                                                fontFamily: StyleScheme.engFontFamily,
                                              ),
                                            ),
                                            Text(
                                              '3.5',
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: StyleScheme.engFontFamily,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 15.w,),
                                      Chip(
                                        avatar: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            Icons.data_usage_rounded,
                                            color: context.theme.colorScheme.outline,
                                            size: 20.sp,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                                        labelPadding: const EdgeInsets.only(right: 5),
                                        surfaceTintColor: Colors.transparent,
                                        side: BorderSide(
                                          color: context.theme.colorScheme.outlineVariant,
                                          width: 1,
                                        ),
                                        label: Wrap(
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          spacing: 5,
                                          children: [
                                            Text(
                                              'Progress',
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                                color: context.theme.colorScheme.outline,
                                                fontFamily: StyleScheme.engFontFamily,
                                              ),
                                            ),
                                            Text(
                                              '76%',
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: StyleScheme.engFontFamily,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
          ),
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
}