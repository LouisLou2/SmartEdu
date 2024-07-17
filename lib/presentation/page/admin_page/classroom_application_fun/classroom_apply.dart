import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/domain/entity/campus.dart';
import 'package:smart_edu/domain/entity/classroom_statics_mode.dart';
import 'package:smart_edu/domain/general/option_section.dart';
import 'package:smart_edu/domain/entity/term.dart';
import 'package:smart_edu/domain/general/tuple2.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/domain/entity/classroom_apply_datas.dart';
import 'package:smart_edu/presentation/page/admin_page/pagination_bar.dart';
import 'package:smart_edu/presentation/widget/text_list.dart';
import 'package:smart_edu/state/admin_apply_prov.dart';
import 'package:smart_edu/state/base_info_prov.dart';
import 'package:smart_edu/state/classroom_apply_prov.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/util/pluto_table_util.dart';

class ClassroomList extends StatefulWidget {
  const ClassroomList({Key? key}) : super(key: key);

  @override
  _ClassroomListState createState() => _ClassroomListState();

  // ClassroomApplyDatas(
  //     ClassroomApplyItem(      reserveId: 1,
  //     teacherId: '1',
  //     year: 2023,
  //     week: 1,
  //     dayOfWeek: 1,
  //     periodFrom: 1,
  //     periodTo: 2,
  //     reason: 1,
  //     class_name:"A202",
  //     reasonDetail: '教学活动',
  //     actName: '教学活动',)
  //   )
}

class _ClassroomListState extends State<ClassroomList> {
  final BaseInfoProv baseInfoProv = ProvManager.baseInfoProv;
  final ApplyProv applyProv = ProvManager.applyProv;
  final NumberPaginatorController controller = NumberPaginatorController();
  ShadPopoverController popoverController = ShadPopoverController();

  List<PlutoRow> getRowsFromClassroomApply(
      List<ClassroomApplyItem> classroomApply) {
    return classroomApply
        .map((e) => PlutoRow(cells: {
              'reserveId': PlutoCell(value: e.reserveId),
              'teacherId': PlutoCell(value: e.teacherId),
              'time': PlutoCell(
                  value: getApplyTime(
                      year: e.year,
                      week: e.week,
                      dayOfWeek: e.dayOfWeek,
                      periodFrom: e.periodFrom,
                      periodTo: e.periodTo)),
              'reason': PlutoCell(value: e.reason),
              'class_name': PlutoCell(value: e.className),
              'actName': PlutoCell(value: e.actName),
              'reasonDetail': PlutoCell(
                  value: ShadPopover(
                controller: popoverController,
                popover: (context) {
                  return Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Text(e.reasonDetail ?? ""),
                  );
                },
                child: ShadButton(
                  text: Text("详情"),
                  onPressed: () {
                    popoverController.toggle();
                  },
                ),
              )),
              'operation': PlutoCell(
                value: ShadButton(
                  text: Text("审批"),
                  onPressed: () {
                    final targetReserveId = e.reserveId;
                    showShadDialog(
                        context: context,
                        builder: (context) => ShadDialog(
                              content: Container(
                                child: Column(
                                  children: [
                                    ShadSelect<String>(
                                        placeholder: const Text('选择处理类型'),
                                        options: const [
                                          Text("不通过"),
                                          Text("通过"),
                                          Text("暂不处理")
                                        ],
                                        selectedOptionBuilder:
                                            (context, value) {
                                          return Text(
                                              value.toString() ?? "hello");
                                        }),
                                    ShadInput(
                                      minLines: 4,
                                      maxLines: 8,
                                      placeholder: Text("填写审批意见"),
                                    ),
                                    ShadButton(
                                      text: const Text("提交"),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                  },
                ),
              ),
            }))
        .toList();
  }

  String getApplyTime({year, week, dayOfWeek, periodFrom, periodTo}) {
    String applyTime = year.toString() +
        "年第" +
        week.toString() +
        "周" +
        "星期" +
        dayOfWeek.toString() +
        ' ' +
        periodFrom.toString() +
        "节至" +
        periodTo.toString() +
        "节";
    print(applyTime);
    return applyTime;
  }

  List<PlutoColumn> plutoColumns = [
    PlutoColumn(
      title: '编号',
      field: 'reserveId',
      type: PlutoColumnType.text(),
      suppressedAutoSize: true,
      textAlign: PlutoColumnTextAlign.center,
      titleTextAlign: PlutoColumnTextAlign.center,
      width: 20.w,
    ),
    PlutoColumn(
      title: '教师编号',
      field: 'teacherId',
      type: PlutoColumnType.text(),
      suppressedAutoSize: true,
      textAlign: PlutoColumnTextAlign.center,
      titleTextAlign: PlutoColumnTextAlign.center,
      width: 120.w,
    ),
    PlutoColumn(
      title: '年份',
      field: 'time',
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.center,
      titleTextAlign: PlutoColumnTextAlign.center,
      width: 340.w,
    ),
    PlutoColumn(
      title: '原因',
      field: 'reason',
      type: PlutoColumnType.number(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.center,
      titleTextAlign: PlutoColumnTextAlign.center,
    ),
    PlutoColumn(
      title: '班级名称',
      field: 'class_name',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.center,
      titleTextAlign: PlutoColumnTextAlign.center,
    ),
    PlutoColumn(
      title: '活动名称',
      field: 'actName',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.center,
      titleTextAlign: PlutoColumnTextAlign.center,
    ),
    PlutoColumn(
      title: '原因详情',
      field: 'reasonDetail',
      type: PlutoColumnType.text(),
      textAlign: PlutoColumnTextAlign.center,
      titleTextAlign: PlutoColumnTextAlign.center,
      enableEditingMode: false,
      renderer: (rendererContext) {
        return FittedBox(
          child: rendererContext.cell.value ?? "详情显现错误",
        );
      },
    ),
    PlutoColumn(
      title: '操作',
      field: 'operation',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      renderer: (rendererContext) {
        return FittedBox(
          child: rendererContext.cell.value ?? "详情显现错误",
        );
      },
    ),
  ];
  late OptionSection campusOptions;
  late OptionSection buildingOptions;
  late List<Campus> campusList;
  late PlutoGridStateManager stateManager; // 声明一个变量来存储stateManager

  @override
  void initState() {
    campusList = [
      Campus(campusId: 1, campus_name: '铁道校区', building: ['世纪楼', '铁2舍']),
      Campus(campusId: 2, campus_name: '校本部', building: ['创业楼', '教学楼']),
      Campus(campusId: 3, campus_name: '新校区', building: ['A座', 'B座']),
    ];
    campusOptions = OptionSection.fromCampus(campusList);

    buildingOptions = OptionSection.fromBuilding(campusList[0].building);
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      applyProv.searchClassrooms();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ApplyProv, bool>(
      selector: (p0, p1) => p1.isStudentsNull,
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, isNull, child) {
        if (isNull) {
          return Center(
            child: const CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              Container(
                height: 100.h,
                width: 900.w,
                padding: EdgeInsets.only(left: 20.w),
                child: ShadAlert(
                  iconSize: Size(15.w, 15.h),
                  iconSrc: LucideIcons.search,
                  description: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Selector<BaseInfoProv, List<Campus>>(
                        selector: (context, baseInfoProv) =>
                            baseInfoProv.campus,
                        builder: (context, campusList, child) {
                          return ShadSelect<Tuple2<int, int>>(
                            placeholder: Text(
                              '选择校区',
                              style:
                                  context.theme.textTheme.bodyMedium?.copyWith(
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
                              applyProv.setReqCampus(value.item2 - 1);
                            },
                            selectedOptionBuilder:
                                (BuildContext context, Tuple2<int, int> value) {
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
                      Selector<ApplyProv, int>(
                        selector: (context, sp) => sp.selectedCampusInd,
                        builder: (context, selectId, child) {
                          return ShadSelect<Tuple2<int, int>>(
                            placeholder: Text(
                              '选择楼栋',
                              style:
                                  context.theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            options: getTextList(
                              [
                                getBuildingList(selectId == -1
                                    ? []
                                    : baseInfoProv.campus[selectId].building)
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
                                    ? '全部楼栋'
                                    : baseInfoProv.campus[selectId]
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
                          '选择教室',
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        options: getTextList(
                          [campusOptions],
                          context,
                        ),
                        onChanged: (value) {
                          print('@@@@@@@@@@@@@@$value');
                        },
                        selectedOptionBuilder:
                            (BuildContext context, Tuple2<int, int> value) {
                          return Text(
                            campusOptions.options[value.item2],
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                      ShadSelect<Tuple2<int, int>>(
                        placeholder: Text(
                          '根据审核意见',
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        options: getTextList(
                          [campusOptions],
                          context,
                        ),
                        onChanged: (value) {
                          print('@@@@@@@@@@@@@@$value');
                        },
                        selectedOptionBuilder:
                            (BuildContext context, Tuple2<int, int> value) {
                          return Text(
                            campusOptions.options[value.item2],
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
                          print("教室预约查询");
                          applyProv.searchClassrooms().then((e) {
                            stateManager.removeAllRows();
                            List<PlutoRow> rows = getRowsFromClassroomApply(
                                applyProv.nowClassrooms);
                            stateManager.insertRows(0, rows);
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              Selector<ApplyProv, List<ClassroomApplyItem>>(
                selector: (p0, p1) => p1.nowClassrooms,
                shouldRebuild: (previous, next) => previous != next,
                builder: (context, list, child) {
                  print(list);
                  return Expanded(
                    flex: 7,
                    child: PlutoGrid(
                      columns: plutoColumns,
                      configuration: PlutoGridConfiguration(
                          style: PlutoTableUtil.gridStyleConfig(context)),
                      onLoaded: (e) => stateManager = e.stateManager,
                      rows: [
                        ...list.map((e) => PlutoRow(cells: {
                              'reserveId': PlutoCell(value: e.reserveId),
                              'teacherId': PlutoCell(value: e.teacherId),
                              'time': PlutoCell(
                                  value: getApplyTime(
                                      year: e.year,
                                      week: e.week,
                                      dayOfWeek: e.dayOfWeek,
                                      periodFrom: e.periodFrom,
                                      periodTo: e.periodTo)),
                              'reason': PlutoCell(value: e.reason),
                              'class_name': PlutoCell(value: e.className),
                              'actName': PlutoCell(value: e.actName),
                              'reasonDetail': PlutoCell(
                                  value: ShadPopover(
                                controller: popoverController,
                                popover: (context) {
                                  return Padding(
                                    padding: EdgeInsets.all(10.r),
                                    child: Text(e.reasonDetail ?? ""),
                                  );
                                },
                                child: ShadButton(
                                  text: Text("详情"),
                                  onPressed: () {
                                    popoverController.toggle();
                                  },
                                ),
                              )),
                              'operation': PlutoCell(
                                value: ShadButton(
                                  text: Text("审批"),
                                  onPressed: () {
                                    final targetReserveId = e.reserveId;
                                    showShadDialog(
                                        context: context,
                                        builder: (context) => ShadDialog(
                                              content: Container(
                                                child: Column(
                                                  children: [
                                                    ShadSelect<String>(
                                                        placeholder: const Text(
                                                            '选择处理类型'),
                                                        options: const [
                                                          Text("不通过"),
                                                          Text("通过"),
                                                          Text("暂不处理")
                                                        ],
                                                        selectedOptionBuilder:
                                                            (context, value) {
                                                          return Text(value
                                                                  .toString() ??
                                                              "hello");
                                                        }),
                                                    ShadInput(
                                                      minLines: 4,
                                                      maxLines: 8,
                                                      placeholder:
                                                          Text("填写审批意见"),
                                                    ),
                                                    ShadButton(
                                                      text: const Text("提交"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                  },
                                ),
                              ),
                            }))
                      ],
                    ),
                  );
                },
              ),
              Selector<ApplyProv, int>(
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
                            numberPages: applyProv.pageTotal,
                            onPageChange: (int index) {
                              applyProv
                                  .setReqPageAndSearch(index)
                                  .then((onValue) {
                                stateManager.removeAllRows();
                                List<PlutoRow> rows = getRowsFromClassroomApply(
                                    applyProv.nowClassrooms);
                                stateManager.insertRows(0, rows);
                              });
                            },
                            // initially selected index
                            initialPage: applyProv.nowPageInd,
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
            ],
          );
        }
      },
    );
  }
}
