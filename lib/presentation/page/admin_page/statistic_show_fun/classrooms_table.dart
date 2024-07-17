import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/domain/entity/campus.dart';
import 'package:smart_edu/domain/general/option_section.dart';
import 'package:smart_edu/domain/entity/term.dart';
import 'package:smart_edu/domain/general/tuple2.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/domain/entity/classroom_statics_mode.dart';
import 'package:smart_edu/presentation/page/admin_page/pagination_bar.dart';
import 'package:smart_edu/presentation/widget/text_list.dart';
import 'package:smart_edu/state/base_info_prov.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/state/statics_prov.dart';
import 'package:smart_edu/state/statics_view_prov.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/util/pluto_table_util.dart';

class ClassroomsTable extends StatefulWidget {
  const ClassroomsTable({Key? key}) : super(key: key);

  @override
  _ClassroomsTableState createState() => _ClassroomsTableState();
  List<PlutoColumn> getColumnFromClassroom(bool isReadOnly) {
    return <PlutoColumn>[
      PlutoColumn(
        title: '教室编号',
        field: 'classroomId',
        type: PlutoColumnType.text(),
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '具体位置',
        field: 'classroomName',
        type: PlutoColumnType.text(),
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '所在校区',
        field: 'campusName',
        type: PlutoColumnType.text(),
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '楼栋',
        field: 'building',
        type: PlutoColumnType.text(),
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '状态',
        field: 'status',
        type: PlutoColumnType.text(),
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '座位',
        field: 'seatNum',
        type: PlutoColumnType.text(),
        suppressedAutoSize: true,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        width: 120.w,
      ),
      PlutoColumn(
        title: '面积',
        field: 'area',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
      ),
    ];
  }

  List<PlutoRow> getRowsFromClassroom(List<ClassroomStaticItem> classrooms) {
    return classrooms.map((classroom) {
      return PlutoRow(
        cells: {
          'classroomId': PlutoCell(value: classroom.classroomId),
          'classroomName': PlutoCell(value: classroom.classroomName),
          'campusName': PlutoCell(value: classroom.campusName),
          'building': PlutoCell(value: classroom.building),
          'status': PlutoCell(value: classroom.status),
          'seatNum': PlutoCell(value: classroom.seatNum),
          'area': PlutoCell(value: classroom.area),
        },
      );
    }).toList();
  }
}

class _ClassroomsTableState extends State<ClassroomsTable> {
  final StaticsProv sp = ProvManager.staticsProv;
  final BaseInfoProv bp = ProvManager.baseInfoProv;
  final NumberPaginatorController controller = NumberPaginatorController();
  late PlutoGridStateManager stateManager; // 声明一个变量来存储stateManager

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sp.getClassrooms();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<StaticsProv, bool>(
        selector: (_, prov) => prov.isClassroomEmpty,
        shouldRebuild: (previous, next) => previous != next,
        builder: (context, isNull, child) {
          if (isNull) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Expanded(
                child: Container(
                    child: Column(
              children: [
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
                        //下拉校区选择
                        Selector<BaseInfoProv, List<Campus>>(
                          selector: (context, baseInfoProv) =>
                              baseInfoProv.campus,
                          builder: (context, campusList, child) {
                            return ShadSelect<Tuple2<int, int>>(
                              placeholder: Text(
                                '选择校区',
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              options: getTextList(
                                [
                                  getCampusList(campusList),
                                ],
                                context,
                              ),
                              onChanged: (value) {
                                print('@@@@@@@@@@@@@@$value');
                                sp.setReqCampus(value.item2 - 1);
                              },
                              selectedOptionBuilder: (BuildContext context,
                                  Tuple2<int, int> value) {
                                return Text(
                                  value.item2 == 0
                                      ? '全部校区'
                                      : campusList[value.item2 - 1].campus_name,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        //下拉楼栋选择
                        Selector<StaticsProv, int>(
                          selector: (context, sp) => sp.selectedCampus,
                          builder: (context, selectId, child) {
                            return ShadSelect<Tuple2<int, int>>(
                              placeholder: Text(
                                '选择楼栋',
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              options: getTextList(
                                [
                                  getBuildingList(selectId == -1
                                      ? []
                                      : bp.campus[selectId].building)
                                ],
                                context,
                              ),
                              onChanged: (value) {
                                print('@@@@@@@@@@@@@@$value');
                              },
                              selectedOptionBuilder: (BuildContext context,
                                  Tuple2<int, int> value) {
                                return Text(
                                  value.item2 == 0
                                      ? '全部楼栋'
                                      : bp.campus[selectId]
                                          .building[value.item2 - 1],
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
                            [],
                            context,
                          ),
                          onChanged: (value) {
                            print('@@@@@@@@@@@@@@$value');
                          },
                          selectedOptionBuilder:
                              (BuildContext context, Tuple2<int, int> value) {
                            return Text(
                              "??",
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
                            sp.getClassrooms().then(
                              (value) {
                                stateManager.removeAllRows();
                                List<PlutoRow> rows = widget
                                    .getRowsFromClassroom(sp.classroomStatics);
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
                  selector: (p0, p1) => p1.classroomPage,
                  shouldRebuild: (previous, next) => previous != next,
                  builder: (context, pageNum, child) {
                    return Expanded(
                      flex: 7,
                      child: PlutoGrid(
                        columns: widget.getColumnFromClassroom(true),
                        mode: PlutoGridMode.readOnly,
                        onLoaded: (e) => stateManager = e.stateManager,
                        configuration: PlutoGridConfiguration(
                            style: PlutoTableUtil.gridStyleConfig(context)),
                        rows: widget.getRowsFromClassroom(sp.classroomStatics),
                      ),
                    );
                  },
                ),
                Selector<StaticsProv, int>(
                  selector: (p0, p1) => p1.classroomPage,
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
                              numberPages: sp.classroomPageTotal,
                              onPageChange: (int index) {
                                sp.setClassroomReqPageAndSearch(index).then(
                                  (value) {
                                    stateManager.removeAllRows();
                                    List<PlutoRow> rows =
                                        widget.getRowsFromClassroom(
                                            sp.classroomStatics);
                                    stateManager.insertRows(0, rows);
                                  },
                                );
                              },
                              // initially selected index
                              initialPage: sp.classroomPage,
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
                )
              ],
            )));
          }
        });
  }
}
