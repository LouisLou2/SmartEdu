import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/domain/entity/campus.dart';
import 'package:smart_edu/domain/entity/major.dart';
import 'package:smart_edu/domain/entity/school.dart';
import 'package:smart_edu/domain/general/option_section.dart';
import 'package:smart_edu/domain/entity/term.dart';
import 'package:smart_edu/domain/general/tuple2.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/domain/entity/class_statics_item.dart';
import 'package:smart_edu/presentation/page/admin_page/pagination_bar.dart';
import 'package:smart_edu/presentation/widget/text_list.dart';
import 'package:smart_edu/state/base_info_prov.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/state/statics_page_prov.dart';
import 'package:smart_edu/state/statics_prov.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/util/pluto_table_util.dart';

class ClassesTable extends StatefulWidget {
  const ClassesTable({Key? key}) : super(key: key);

  @override
  _ClassesTableState createState() => _ClassesTableState();

  List<PlutoColumn> getColumnFromClasses(bool isReadOnly) {
    return <PlutoColumn>[
      PlutoColumn(
        title: '班级编号',
        field: 'class_id',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '班级名称',
        field: 'class_name',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '专业名称',
        field: 'major_name',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '校区名称',
        field: 'campus_name',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '入学年份',
        field: 'start_year',
        type: PlutoColumnType.number(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '辅导员编号',
        field: 'conselor_id',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '男生人数',
        field: 'male_num',
        type: PlutoColumnType.number(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '女生人数',
        field: 'female_num',
        type: PlutoColumnType.number(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      )
    ];
  }

  List<PlutoRow> getRowsFromClasses(List<ClassStaticsItem> classes) {
    return classes.map((e) {
      return PlutoRow(
        cells: {
          'class_id': PlutoCell(value: e.classId),
          'class_name': PlutoCell(value: e.className),
          'major_name': PlutoCell(value: e.majorName),
          'campus_name': PlutoCell(value: e.campusName),
          'start_year': PlutoCell(value: e.startYear),
          'conselor_id': PlutoCell(value: e.conselorId),
          'male_num': PlutoCell(value: e.maleNum),
          'female_num': PlutoCell(value: e.femaleNum),
        },
      );
    }).toList();
  }
}

class _ClassesTableState extends State<ClassesTable> {
  late List<Term> termList;
  final StaticsProv sp = ProvManager.staticsProv;
  final BaseInfoProv bp = ProvManager.baseInfoProv;
  late OptionSection optionSection;
  final NumberPaginatorController controller = NumberPaginatorController();
  late PlutoGridStateManager stateManager; // 声明一个变量来存储stateManager

  @override
  void initState() {
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
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      sp.getClasses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<StaticsProv, bool>(
      selector: (context, prov) => prov.isClassEmpty,
      shouldRebuild: (pre, next) => pre != next,
      builder: (context, isNull, child) {
        if (isNull) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Expanded(
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                height: 100.h,
                width: 800.w,
                padding: EdgeInsets.only(left: 20.w),
                child: ShadAlert(
                  iconSize: Size(15.w, 15.h),
                  iconSrc: LucideIcons.search,
                  description: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Selector<BaseInfoProv, List<School>>(
                        selector: (context, prov) => prov.schools,
                        shouldRebuild: (pre, next) => pre != next,
                        builder: (context, schools, child) {
                          return ShadSelect<Tuple2<int, int>>(
                            placeholder: Text(
                              '学院',
                              style:
                                  context.theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            options: getTextList(
                              [getSchoolList(bp.schools)],
                              context,
                            ),
                            onChanged: (value) {
                              sp.setReqSchool(value.item2 - 1);
                            },
                            selectedOptionBuilder:
                                (BuildContext context, Tuple2<int, int> value) {
                              return Text(
                                value.item2 == 0
                                    ? '不限'
                                    : bp.schools[value.item2 - 1].schoolName,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      //根据学院选择专业
                      Selector<StaticsProv, int>(
                        selector: (context, prov) => prov.selectedSchool,
                        shouldRebuild: (pre, next) => pre != next,
                        builder: (context, selectId, child) {
                          return ShadSelect<Tuple2<int, int>>(
                            placeholder: Text(
                              '专业',
                              style:
                                  context.theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            options: getTextList(
                              [
                                getMajorList(selectId == -1
                                    ? []
                                    : bp.schools[selectId].majors),
                              ],
                              context,
                            ),
                            onChanged: (value) {
                              print('@@@@@@@@@@@@@@$value');
                            },
                            selectedOptionBuilder:
                                (BuildContext context, Tuple2<int, int> value) {
                              return Text(
                                value.item2 == 0
                                    ? '不限'
                                    : bp.schools[selectId]
                                        .majors[value.item2 - 1].majorName,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      ShadSelect<Tuple2<int, int>>(
                        placeholder: Text(
                          '具体教室',
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        options: getTextList(
                          [optionSection],
                          context,
                        ),
                        onChanged: (value) {
                          sp.setReqMajor(value.item2 - 1);
                        },
                        selectedOptionBuilder:
                            (BuildContext context, Tuple2<int, int> value) {
                          return Text(
                            optionSection.options[value.item2],
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                      ShadButton(
                        text: Text("查询"),
                        onPressed: () {
                          sp.getClasses().then((e) {
                            stateManager.removeAllRows();
                            List<PlutoRow> rows =
                                widget.getRowsFromClasses(sp.classStatics);
                            stateManager.insertRows(0, rows);
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              Selector<StaticsProv, int>(
                selector: (context, prov) => prov.classPage,
                shouldRebuild: (pre, next) => pre != next,
                builder: (context, length, child) {
                  return Expanded(
                    flex: 7,
                    child: PlutoGrid(
                      columns: widget.getColumnFromClasses(true),
                      rows: widget.getRowsFromClasses(sp.classStatics),
                      onLoaded: (event) => stateManager = event.stateManager,
                      configuration: PlutoGridConfiguration(
                        style: PlutoTableUtil.gridStyleConfig(context),
                      ),
                    ),
                  );
                },
              ),
              Selector<StaticsProv, int>(
                selector: (p0, p1) => p1.classPage,
                shouldRebuild: (previous, next) => previous != next,
                builder: (context, pageNum, child) {
                  return Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(maxWidth: 500.w),
                          child: NumberPaginator(
                            controller: controller,
                            // by default, the paginator shows numbers as center content
                            numberPages: sp.pageTotal,
                            onPageChange: (int index) {
                              sp
                                  .setClassReqPageAndSearch(index)
                                  .then((onValue) {
                                stateManager.removeAllRows();
                                List<PlutoRow> rows =
                                    widget.getRowsFromClasses(sp.classStatics);
                                stateManager.insertRows(0, rows);
                              });
                            },

                            // initially selected index
                            initialPage: sp.classPage,
                            config: NumberPaginatorUIConfig(
                              // default height is 48
                              height: 64,
                              buttonShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color:
                                      context.theme.colorScheme.outlineVariant,
                                  width: 0.5,
                                ),
                              ),
                              buttonTextStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: StyleScheme.engFontFamily,
                              ),
                              contentPadding: EdgeInsets.all(8.sp),
                              buttonSelectedForegroundColor:
                                  context.theme.colorScheme.onPrimary,
                              buttonUnselectedForegroundColor:
                                  context.theme.colorScheme.onSurface,
                              buttonUnselectedBackgroundColor:
                                  context.theme.colorScheme.surface,
                              buttonSelectedBackgroundColor:
                                  context.theme.colorScheme.primary,
                            ),
                          )));
                },
              )
            ]),
          );
        }
      },
    );
  }
}
