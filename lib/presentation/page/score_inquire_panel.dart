import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/const/data_status.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/state/prov/score_inquire_prov.dart';
import 'package:smart_edu/state/prov_manager.dart';

import '../../data/basic_data.dart';
import '../../entity/exam_score.dart';
import '../../entity/general/option_section.dart';
import '../../entity/general/tuple2.dart';
import '../../entity/term.dart';
import '../../style/style_scheme.dart';
import '../widget/text_list.dart';

class ScoreInquirePanel extends StatefulWidget {

  const ScoreInquirePanel({super.key});

  @override
  State<ScoreInquirePanel> createState() => _ScoreInquirePanelState();
}

class _ScoreInquirePanelState extends State<ScoreInquirePanel> {
  final ScoreInquireProv scProv = ProvManager.scoreInquireProv;
  late OptionSection YtOptions;

  late List<Term> termList;

  final List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'Year',
      field: 'year',
      type: PlutoColumnType.number(),
      enableSorting: false,
      readOnly: true,
    ),
    PlutoColumn(
      title: 'Term Part',
      field: 'termPart',
      type: PlutoColumnType.text(),
      enableSorting: false,
      readOnly: true,
    ),
    PlutoColumn(
      title: 'Course Inst. ID',
      field: 'courseInstId',
      type: PlutoColumnType.number(),
      enableSorting: false,
      readOnly: true,
    ),
    PlutoColumn(
      title: 'Course Name',
      field: 'courseName',
      type: PlutoColumnType.text(),
      enableSorting: false,
      readOnly: true,
    ),
    PlutoColumn(
      title: 'Score',
      field: 'score',
      type: PlutoColumnType.number(),
      enableSorting: false,
      readOnly: true,
    ),
    PlutoColumn(
      title: 'Credit',
      field: 'credit',
      type: PlutoColumnType.number(),
      enableSorting: false,
      readOnly: true,
    ),
    PlutoColumn(
      title: 'Course Type',
      field: 'courseType',
      type: PlutoColumnType.text(),
      enableSorting: false,
      readOnly: true,
    ),
    PlutoColumn(
      title: 'Course Category',
      field: 'courseCate',
      type: PlutoColumnType.text(),
      enableSorting: false,
      readOnly: true,
    ),
  ];

  void setYearTermSection(){
    termList=[];
    int yearFrom = BasicData.earliestTermYear;
    int yearTo = BasicData.nowYear;
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

  List<PlutoRow> getRows(List<ExamScore> scores) {
    return scores.map((score) {
      return PlutoRow(
        cells: {
          'year': PlutoCell(value: score.year),
          'termPart': PlutoCell(value: score.termPart),
          'courseInstId': PlutoCell(value: score.courseInstId),
          'courseName': PlutoCell(value: score.courseName),
          'score': PlutoCell(value: score.score),
          'credit': PlutoCell(value: score.credit),
          'courseType': PlutoCell(value: score.courseType),
          'courseCate': PlutoCell(value: score.courseCate),
        },
      );
    }).toList();
  }

  List<Widget> getTextList1(List<OptionSection> list){
    List<Widget> widgets= [];
    var theme = context.theme;
    for(int i=0;i<list.length;++i){
      var sec=list[i];
      widgets.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
          child: Text(
            sec.title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              fontFamily: StyleScheme.engFontFamily,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      );
      for(int j=0;j<sec.options.length;++j){
        widgets.add(
          ShadOption<Tuple2<int,int>>(
            value: Tuple2<int,int>(i,j),
            child: Text(
              sec.options[j],
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: StyleScheme.engFontFamily,
              ),
            ),
          ),
        );
      }
    }
    return widgets;
  }

  @override
  void initState() {
    super.initState();
    setYearTermSection();
    YtOptions = OptionSection.fromTerm(termList);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(urging(scProv.status)){
        scProv.fetchScores();
      }
    });
  }

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
                  padding: EdgeInsets.only(left: 5.w, top: 5.h, bottom: 10.h),
                  child: Text(
                    'Score Inquire',
                    style: context.theme.textTheme.titleLarge?.copyWith(
                      fontSize: 35.sp,
                      fontFamily: StyleScheme.engFontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
                  child: ShadSelect<Tuple2<int,int>>(
                    placeholder: Text(
                      '选择学期',
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    initialValue: Tuple2<int,int>(0,0),
                    options: getTextList1([YtOptions],),
                    onChanged: (value) {
                      print('@@@@@@@@@@@@@@value:$value');
                      final yt = getYearTerm(value.item2);
                      scProv.setYearTerm(yt.item1,yt.item2);
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
                ),
                Expanded(
                  child: Selector<ScoreInquireProv, String>(
                    selector: (_, prov) => prov.timeStrKey,
                    shouldRebuild: (pre, next) => pre!=next,
                    builder: ( _, timeStrKey, __ ) {
                      return PlutoGrid(
                        key: ValueKey(timeStrKey),
                        columns: columns,
                        rows: getRows(scProv.scores),
                        onChanged: (PlutoGridOnChangedEvent event) {
                          print(event);
                        },
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}