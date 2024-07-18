import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/const/teacher_title.dart';
import 'package:smart_edu/domain/entity/school.dart';
import 'package:smart_edu/domain/general/option_section.dart';
import 'package:smart_edu/domain/entity/term.dart';
import 'package:smart_edu/domain/general/tuple2.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/domain/entity/teacher_statics_model.dart';
import 'package:smart_edu/presentation/page/admin_page/pagination_bar.dart';
import 'package:smart_edu/presentation/widget/text_list.dart';
import 'package:smart_edu/state/base_info_prov.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/state/statics_prov.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/util/pluto_table_util.dart';

class TeachersTable extends StatefulWidget {
  const TeachersTable({Key? key}) : super(key: key);

  // String? teacherId;
  // String? schoolName;
  // String? majorName;
  // String? teacherName;
  // String? title;
  // String? picUrl;

  @override
  _TeachersTableState createState() => _TeachersTableState();
  List<PlutoColumn> getColumnFromTeachers(bool isReadOnly) {
    return <PlutoColumn>[
      PlutoColumn(
        title: '教师编号',
        field: 'teacherId',
        type: PlutoColumnType.text(),
        enableEditingMode: !isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 250.w,
      ),
      PlutoColumn(
        title: '学校名称',
        field: 'schoolName',
        type: PlutoColumnType.text(),
        enableEditingMode: !isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 250.w,
      ),
      PlutoColumn(
        title: '专业',
        field: 'majorName',
        type: PlutoColumnType.text(),
        enableEditingMode: !isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 250.w,
      ),
      PlutoColumn(
        title: '姓名',
        field: 'teacherName',
        type: PlutoColumnType.text(),
        enableEditingMode: !isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 250.w,
      ),
      PlutoColumn(
        title: '职称',
        field: 'title',
        type: PlutoColumnType.text(),
        enableEditingMode: !isReadOnly,
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 250.w,
      ),
    ];
  }

  List<PlutoRow> getRowsFromTeachers(List<TeacherStaticsItem> teachers) {
    return teachers.map((teacher) {
      return PlutoRow(
        cells: {
          'teacherId': PlutoCell(value: teacher.teacherId),
          'schoolName': PlutoCell(value: teacher.schoolName),
          'majorName': PlutoCell(value: teacher.majorName),
          'teacherName': PlutoCell(value: teacher.teacherName),
          'title': PlutoCell(value: teacher.title),
        },
      );
    }).toList();
  }
}

class _TeachersTableState extends State<TeachersTable> {
  late List<Term> termList;

  late OptionSection optionSection;
  final StaticsProv sp = ProvManager.staticsProv;
  final BaseInfoProv bp = ProvManager.baseInfoProv;
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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sp.searchTeachers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<StaticsProv, bool>(
      selector: (_, prov) => prov.isTeachersEmpty,
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, isNull, child) {
        if (isNull) {
          return Center(
            child: const CircularProgressIndicator(),
          );
        } else {
          return Expanded(
            child: Container(
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
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              options: getTextList(
                                [getSchoolList(bp.schools)],
                                context,
                              ),
                              onChanged: (value) {
                                sp.setTeacherReqSchool(value.item2 - 1);
                              },
                              selectedOptionBuilder: (BuildContext context,
                                  Tuple2<int, int> value) {
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
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
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
                                sp.setTeacherReqMajor(value.item2 - 1);
                              },
                              selectedOptionBuilder: (BuildContext context,
                                  Tuple2<int, int> value) {
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
                            '选择职称',
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          options: [
                            ...List.generate(TeacherTitle.titles.length,
                                (index) {
                              return ShadOption<Tuple2<int, int>>(
                                value: Tuple2<int, int>(0, index + 1),
                                child: Text(
                                  TeacherTitle.titles[index],
                                  style: context.theme.textTheme.bodyMedium
                                      ?.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            })
                          ],
                          onChanged: (value) {
                            sp.setReqTitle(value.item2);
                          },
                          selectedOptionBuilder:
                              (BuildContext context, Tuple2<int, int> value) {
                            return Text(
                              TeacherTitle.titles[value.item2 - 1],
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        ),
                        //根据性别选择

                        ShadButton(
                          text: Text("查询"),
                          onPressed: () {
                            sp.searchTeachers().then(
                              (value) {
                                stateManager.removeAllRows();
                                List<PlutoRow> rows =
                                    widget.getRowsFromTeachers(sp.nowTeachers);
                                stateManager.insertRows(0, rows);
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Selector<StaticsProv, int>(
                  selector: (_, prov) => prov.teacherSearchCount,
                  shouldRebuild: (previous, next) => previous != next,
                  builder: (context, value, child) {
                    //表格
                    return Expanded(
                      flex: 7,
                      child: PlutoGrid(
                        columns: widget.getColumnFromTeachers(false),
                        onLoaded: (event) => stateManager = event.stateManager,
                        mode: PlutoGridMode.readOnly,
                        configuration: PlutoGridConfiguration(
                            style: PlutoTableUtil.gridStyleConfig(context)),
                        rows: widget.getRowsFromTeachers(sp.nowTeachers),
                        onChanged: (PlutoGridOnChangedEvent event) {
                          print(event);
                        },
                      ),
                    );
                  },
                ),
                Selector<StaticsProv, int>(
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
                              numberPages: sp.teacherPageTotal,
                              onPageChange: (int index) {
                                sp.setReqPageAndSearch(index).then(
                                  (value) {
                                    stateManager.removeAllRows();
                                    List<PlutoRow> rows = widget
                                        .getRowsFromTeachers(sp.nowTeachers);
                                    stateManager.insertRows(0, rows);
                                  },
                                );
                              },
                              // initially selected index
                              initialPage: sp.nowPageInd,
                              config: NumberPaginatorUIConfig(
                                // default height is 48
                                height: 64,
                                buttonShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                    color: context
                                        .theme.colorScheme.outlineVariant,
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
            ),
          );
        }
      },
    );
  }
}
