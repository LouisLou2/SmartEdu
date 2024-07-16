import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/const/teacher_title.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/widget/leading_title.dart';
import 'package:smart_edu/style/style_scheme.dart';

import '../../../entity/option_section.dart';
import '../../../entity/term.dart';
import '../../../entity/tuple2.dart';
import '../../widget/text_list.dart';

class FacultySearch extends StatefulWidget {
  const FacultySearch({super.key});

  @override
  State<FacultySearch> createState() => _FacultySearchState();
}

class _FacultySearchState extends State<FacultySearch> {

  late List<Term> termList;

  late OptionSection optionSection;

  final NumberPaginatorController controller = NumberPaginatorController();
  int _currentPage = 0;

  @override
  void initState(){
    termList = [
      Term(year: 2020, term: false, weekNum: 16),
      Term(year: 2020, term: true, weekNum: 16),
      Term(year: 2021, term: false, weekNum: 16),
      Term(year: 2021, term: true, weekNum: 16),
      Term(year: 2022, term: false, weekNum: 16),
      Term(year: 2022, term: true, weekNum: 16),
      Term(year: 2023, term: false, weekNum: 16),
      Term(year: 2023, term: true, weekNum: 16),
      Term(year: 2024, term: false, weekNum: 16),
      Term(year: 2024, term: true, weekNum: 16),
      Term(year: 2025, term: false, weekNum: 16),
      Term(year: 2025, term: true, weekNum: 16),
    ];
    optionSection = OptionSection.fromTerm(termList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mtheme = context.theme;
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontFamily: StyleScheme.engFontFamily,
              fontWeight: FontWeight.w400,
            ),
            pinned: true,
            foregroundColor: Colors.black,
            floating: false,
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(
                left: 45.w,
                bottom: 10.h,
                top: 10.h,
              ),
              centerTitle: false,
              title: Wrap(
                children: [
                  Text(
                    'Faculty ',
                    style: TextStyle(
                      color: const Color(0xff005dad),
                      fontSize: 30.sp,
                      fontFamily: StyleScheme.engFontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Search',
                    style: TextStyle(
                      color: context.theme.colorScheme.primary,
                      fontSize: 30.sp,
                      fontFamily: StyleScheme.engFontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              background: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset("assets/image/csu3.jpg",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      color: Colors.white.withAlpha(0),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 30.w, top: 30.h),
                    child: Wrap(
                      spacing: 8.w,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset("assets/image/csu.gif",
                          width: 50.w,
                        ),
                        Text(
                          'CSU Infomation Portal',
                          style: TextStyle(
                            color: const Color(0xff005dad),
                            fontSize: 35.sp,
                            fontFamily: StyleScheme.engFontFamily,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 30.w, bottom: 60.h,),
                    child: Text(
                      'Central South Uni.',
                      style: TextStyle(
                        color: const Color(0xff005dad),
                        fontSize: 90.sp,
                        fontFamily: StyleScheme.engFontFamily,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.3,
                        wordSpacing: 1.5,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 20,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10.w,
                      children: [
                        Text(
                          '2,456',
                          style: TextStyle(
                            color: const Color(0xff005dad),
                            fontSize: 50.sp,
                            letterSpacing: -0.5,
                            fontFamily: StyleScheme.engFontFamily,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'ACTIVATED',
                          style: TextStyle(
                            color: const Color(0xff005dad),
                            fontSize: 20.sp,
                            letterSpacing: -0.5,
                            fontFamily: StyleScheme.engFontFamily,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              if(index==0){
                return Container(
                  margin: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 20.h,
                    bottom:20.h,
                  ),
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
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              color: mtheme.colorScheme.primary,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Muti-Condition Search',
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5,
                                color: mtheme.colorScheme.primary,
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15.w,
                          right: 15.w,
                          bottom: 10.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'School',
                              style: TextStyle(
                                fontSize: 18.sp,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                                fontFamily: StyleScheme.engFontFamily,
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            ShadSelect<Tuple2<int,int>>(
                              placeholder: Text(
                                '不限学院',
                                style: context.theme.textTheme.bodyMedium?.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              options: getTextList([optionSection], context,),
                              onChanged: (value) {
                                print('@@@@@@@@@@@@@@$value');
                              },
                              selectedOptionBuilder: (BuildContext context, Tuple2<int, int> value) {
                                return Text(
                                  optionSection.options[value.item2],
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              'Major',
                              style: TextStyle(
                                fontSize: 18.sp,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                                fontFamily: StyleScheme.engFontFamily,
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            ShadSelect<Tuple2<int,int>>(
                              placeholder: Text(
                                '不限学科',
                                style: context.theme.textTheme.bodyMedium?.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              options: getTextList([optionSection], context,),
                              onChanged: (value) {
                                print('@@@@@@@@@@@@@@$value');
                              },
                              selectedOptionBuilder: (BuildContext context, Tuple2<int, int> value) {
                                return Text(
                                  optionSection.options[value.item2],
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15.w,
                          right: 15.w,
                          bottom: 15.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Title',
                              style: TextStyle(
                                fontSize: 18.sp,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                                fontFamily: StyleScheme.engFontFamily,
                              ),
                            ),
                            SizedBox(
                              width: 35.w,
                            ),
                            SegmentedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  mtheme.colorScheme.surfaceContainerHighest,
                                ),
                                foregroundColor: WidgetStateProperty.all<Color>(
                                  mtheme.colorScheme.onSurface,
                                ),
                                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                side: WidgetStateProperty.all<BorderSide>(
                                  BorderSide(
                                    color: mtheme.colorScheme.outlineVariant,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              segments: [
                                ButtonSegment(
                                  value: 0,
                                  label: Text(
                                    '不限',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                ...List.generate(TeacherTitle.titles.length,
                                   (index)=> ButtonSegment(
                                     value: index+1,
                                     label: Text(
                                       TeacherTitle.titles[index],
                                       style: TextStyle(
                                         fontSize: 15.sp,
                                         fontWeight: FontWeight.w400,
                                       ),
                                     ),
                                   ),
                                )
                              ],
                              selected: {0},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15.w,
                          right: 15.w,
                          bottom: 15.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Title',
                              style: TextStyle(
                                fontSize: 18.sp,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                                fontFamily: StyleScheme.engFontFamily,
                              ),
                            ),
                            SizedBox(
                              width: 35.w,
                            ),
                            SegmentedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  mtheme.colorScheme.surfaceContainerHighest,
                                ),
                                foregroundColor: WidgetStateProperty.all<Color>(
                                  mtheme.colorScheme.onSurface,
                                ),
                                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                side: WidgetStateProperty.all<BorderSide>(
                                  BorderSide(
                                    color: mtheme.colorScheme.outlineVariant,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              segments: [
                                ButtonSegment(
                                  value: 0,
                                  label: Text(
                                    '不限',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                ButtonSegment(
                                  value: 1,
                                  label: Text(
                                    '男',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                ButtonSegment(
                                  value: 2,
                                  label: Text(
                                    '女',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                              selected: {0},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15.w,
                          right: 15.w,
                          bottom: 15.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 18.sp,
                                letterSpacing: -0.5,
                                fontWeight: FontWeight.w500,
                                fontFamily: StyleScheme.engFontFamily,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 180,
                                maxHeight: 70,
                              ),
                              child: ShadInput(
                                decoration: ShadDecoration(
                                  border: ShadBorder(
                                    color: mtheme.colorScheme.outlineVariant,
                                    width: 1,
                                  ),
                                ),
                                placeholder: Text(
                                  '请输入教师姓名',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: StyleScheme.cnFontFamily,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            SizedBox(
                              width: 330.w,
                            ),
                            OutlinedButton(
                              onPressed: (){},
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: mtheme.colorScheme.primary,
                                  width: 1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Search',
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
                    ],
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.only(
                  left: 22.w,
                  right: 15.w,
                  bottom: 15.h,
                ),
                child: LeadingTitle(
                  title: 'Result',
                  fontSize: 22.sp,
                  fontFamily: StyleScheme.engFontFamily,
                ),
              );
            },
            itemCount: 2,
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 22.w,
              right: 22.w,
              bottom: 20.h,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 13.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: context.theme.colorScheme.outlineVariant,
                        width: 0.5,
                      ),
                    ),
                    child: InkWell(
                      splashColor: mtheme.colorScheme.secondaryContainer,
                      onTap: (){},
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: AspectRatio(
                                aspectRatio: 0.8,
                                child: Image.asset(
                                  'assets/image/aao_admin.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10.w,
                                top: 20.h,
                                bottom: 10.h,
                                right: 10.w,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Caroline Polachek',
                                    style: TextStyle(
                                      fontSize: 19.sp,
                                      letterSpacing: -0.5,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: StyleScheme.engFontFamily,
                                    ),
                                  ),
                                  Text(
                                    '副教授',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff005dad),
                                      fontFamily: StyleScheme.cnFontFamily,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    '硕士生导师 博士生导师',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff005dad),
                                      fontFamily: StyleScheme.cnFontFamily,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    '地球科学学院',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff005dad),
                                      fontFamily: StyleScheme.cnFontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 30.w,
              right: 30.w,
              bottom: 20.h,
            ),
            sliver: SliverList.builder(
                itemCount: 1,
                itemBuilder: (context, index){
                  return NumberPaginator(
                    controller: controller,
                    // by default, the paginator shows numbers as center content
                    numberPages: 50,
                    onPageChange: (int index) {
                      setState(() {
                        _currentPage = index; // _currentPage is a variable within State of StatefulWidget
                      });
                    },
                    // initially selected index
                    initialPage: 4,
                    config: NumberPaginatorUIConfig(
                      // default height is 48
                      height: 64,
                      buttonShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: context.theme.colorScheme.outlineVariant,
                          width: 0.5,
                        ),
                      ),
                      buttonTextStyle: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: StyleScheme.engFontFamily,
                      ),
                      contentPadding: EdgeInsets.all(8.sp),
                      buttonSelectedForegroundColor: context.theme.colorScheme.onPrimary,
                      buttonUnselectedForegroundColor: context.theme.colorScheme.onSurface,
                      buttonUnselectedBackgroundColor: context.theme.colorScheme.surface,
                      buttonSelectedBackgroundColor: context.theme.colorScheme.primary,
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}