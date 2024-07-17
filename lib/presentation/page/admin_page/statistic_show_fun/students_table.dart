import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/domain/entity/school.dart';
import 'package:smart_edu/domain/general/option_section.dart';
import 'package:smart_edu/domain/entity/term.dart';
import 'package:smart_edu/domain/general/tuple2.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/domain/entity/student_statics_model.dart';
import 'package:smart_edu/presentation/page/admin_page/pagination_bar.dart';
import 'package:smart_edu/presentation/widget/text_list.dart';
import 'package:smart_edu/state/base_info_prov.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/state/student_prov.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/util/pluto_table_util.dart';

class StudentsTable extends StatefulWidget {
  const StudentsTable({Key? key}) : super(key: key);

  @override
  _StudentsTableState createState() => _StudentsTableState();

  List<PlutoColumn> getColumnFromStudents(bool isReadOnly) {
    return <PlutoColumn>[
      // this.picUrl,
      // this.name,
      // this.gender,
      // this.stuId,
      // this.phoneNumber,
      // this.majorId,
      // this.majorName,
      // this.birthday,
      // this.address,
      // this.schoolId,
      // this.schoolName,
      // this.gradeLevel,
      // this.indentity,
      PlutoColumn(
        title: '姓名',
        field: 'name',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '性别',
        field: 'gender',
        type: PlutoColumnType.text(),
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
        enableEditingMode: isReadOnly,
      ),
      PlutoColumn(
        title: '学号',
        field: 'stu_id',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '电话号码',
        field: 'phone_number',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '专业ID',
        field: 'major_id',
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
        title: '生日',
        field: 'birthday',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '地址',
        field: 'address',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '学校ID',
        field: 'school_id',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '学校名称',
        field: 'school_name',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '年级',
        field: 'grade_level',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '身份',
        field: 'identity',
        type: PlutoColumnType.text(),
        enableEditingMode: isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
    ];
  }

  List<PlutoRow> getRowsFromStudents(List<StudentStaticsItem> students) {
    return students.map((e) {
      return PlutoRow(cells: {
        'name': PlutoCell(value: e.name),
        'gender': PlutoCell(value: e.gender),
        'stu_id': PlutoCell(value: e.stuId),
        'phone_number': PlutoCell(value: e.phoneNumber),
        'major_id': PlutoCell(value: e.majorId),
        'major_name': PlutoCell(value: e.majorName),
        'birthday': PlutoCell(value: e.birthday),
        'address': PlutoCell(value: e.address),
        'school_id': PlutoCell(value: e.schoolId),
        'school_name': PlutoCell(value: e.schoolName),
        'grade_level': PlutoCell(value: e.gradeLevel),
        'identity': PlutoCell(value: e.indentity),
      });
    }).toList();
  }
}

class _StudentsTableState extends State<StudentsTable> {
  late List<Term> termList;

  late OptionSection optionSection;
  final BaseInfoProv baseInfoProv = ProvManager.baseInfoProv;
  final StudentSearchProv studentSearchProv = ProvManager.studentSearchProv;
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
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      studentSearchProv.searchStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<StudentSearchProv, bool>(
      selector: (context, studentSearchProv) =>
          studentSearchProv.isStudentsNull,
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, isStudentsNull, child) {
        if (isStudentsNull) {
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
                              [getSchoolList(baseInfoProv.schools)],
                              context,
                            ),
                            onChanged: (value) {
                              studentSearchProv.setReqSchool(value.item2 - 1);
                            },
                            selectedOptionBuilder:
                                (BuildContext context, Tuple2<int, int> value) {
                              return Text(
                                value.item2 == 0
                                    ? '不限'
                                    : baseInfoProv
                                        .schools[value.item2 - 1].schoolName,
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
                      Selector<StudentSearchProv, int>(
                        selector: (context, prov) => prov.selectedSchoolInd,
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
                                    : baseInfoProv.schools[selectId].majors),
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
                                    : baseInfoProv.schools[selectId]
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
                          '专业',
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
                          print('@@@@@@@@@@@@@@$value');
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
                      ShadSelect<Tuple2<int, int>>(
                        placeholder: Text(
                          '开课时间',
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
                          print('@@@@@@@@@@@@@@$value');
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
                          studentSearchProv.searchStudents().then(
                            (value) {
                              stateManager.removeAllRows();
                              List<PlutoRow> rows = widget.getRowsFromStudents(
                                  studentSearchProv.nowStudents);
                              stateManager.insertRows(0, rows);
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Selector<StudentSearchProv, int>(
                selector: (_, prov) => prov.searchCount,
                shouldRebuild: (previous, next) => previous != next,
                builder: (context, value, child) {
                  //表格
                  return Expanded(
                    flex: 7,
                    child: PlutoGrid(
                      columns: widget.getColumnFromStudents(false),
                      mode: PlutoGridMode.readOnly,
                      onLoaded: (e) => stateManager = e.stateManager,
                      configuration: PlutoGridConfiguration(
                          style: PlutoTableUtil.gridStyleConfig(context)),
                      rows: widget
                          .getRowsFromStudents(studentSearchProv.nowStudents),
                      onChanged: (PlutoGridOnChangedEvent event) {
                        print(event);
                      },
                    ),
                  );
                },
              ),
              Selector<StudentSearchProv, int>(
                selector: (p0, p1) => p1.nowPageInd,
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
                            numberPages: studentSearchProv.pageTotal,
                            onPageChange: (int index) {
                              studentSearchProv.setReqPageAndSearch(index).then(
                                (value) {
                                  stateManager.removeAllRows();
                                  List<PlutoRow> rows =
                                      widget.getRowsFromStudents(
                                          studentSearchProv.nowStudents);
                                  stateManager.insertRows(0, rows);
                                },
                              );
                            },
                            // initially selected index
                            initialPage: studentSearchProv.nowPageInd,
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
              ),
            ]),
          );
        }
      },
    );
  }
}
