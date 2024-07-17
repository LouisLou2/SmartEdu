import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/domain/entity/campus.dart';
import 'package:smart_edu/domain/general/option_section.dart';
import 'package:smart_edu/domain/entity/term.dart';
import 'package:smart_edu/domain/general/tuple2.dart';
import 'package:smart_edu/domain/req/repair_report_req.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/domain/entity/repair_report_model.dart';
import 'package:smart_edu/presentation/page/admin_page/pagination_bar.dart';
import 'package:smart_edu/presentation/page/admin_page/classroom_repair_fun/repair_detail.dart';
import 'package:smart_edu/presentation/anim_sidebar.dart';
import 'package:smart_edu/presentation/widget/text_list.dart';
import 'package:smart_edu/state/admin_apply_prov.dart';
import 'package:smart_edu/state/base_info_prov.dart';
import 'package:smart_edu/state/prov_manager.dart';
import 'package:smart_edu/state/repair_prov.dart';
import 'package:smart_edu/style/style_scheme.dart';
import 'package:smart_edu/util/pluto_table_util.dart';

class MalfunctionRepair extends StatefulWidget {
  const MalfunctionRepair({Key? key}) : super(key: key);

  @override
  _MalfunctionRepairState createState() => _MalfunctionRepairState();
}

class _MalfunctionRepairState extends State<MalfunctionRepair> {
  List<PlutoColumn> plutoColumns = <PlutoColumn>[
    PlutoColumn(
      title: '编号',
      field: 'report_id',
      type: PlutoColumnType.text(),
      suppressedAutoSize: true,
      textAlign: PlutoColumnTextAlign.center,
      titleTextAlign: PlutoColumnTextAlign.center,
      width: 20.w,
    ),
    PlutoColumn(
      title: '教师上报时间',
      field: 'report_time',
      type: PlutoColumnType.text(),
      suppressedAutoSize: true,
      textAlign: PlutoColumnTextAlign.center,
      titleTextAlign: PlutoColumnTextAlign.center,
      width: 250.w,
    ),
    PlutoColumn(
      title: '校区',
      field: 'campus_name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: '校区编号',
      field: 'campus_id',
      type: PlutoColumnType.text(),
      suppressedAutoSize: true,
      textAlign: PlutoColumnTextAlign.center,
      titleTextAlign: PlutoColumnTextAlign.center,
      width: 120.w,
    ),
    PlutoColumn(
      title: '建筑',
      field: 'building',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: '教室号',
      field: 'classroom_id',
      type: PlutoColumnType.text(),
      suppressedAutoSize: true,
      textAlign: PlutoColumnTextAlign.center,
      titleTextAlign: PlutoColumnTextAlign.center,
      width: 120.w,
    ),
    PlutoColumn(
      title: '具体位置',
      field: 'classroom_name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: '状态',
      field: 'status',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: '详情',
      field: 'fault_desc',
      type: PlutoColumnType.text(),
      renderer: (rendererContext) {
        return FittedBox(
          child: rendererContext.cell.value ?? "详情显现错误",
        );
      },
    ),
    PlutoColumn(
      title: "审批",
      field: "operation",
      type: PlutoColumnType.text(),
      renderer: (rendererContext) {
        return FittedBox(
          child: rendererContext.cell.value ?? "操作显现错误",
        );
      },
    )
  ];
  List<PlutoRow> getRowFromReports(List<Report> reports) {
    List<PlutoRow> plutoRows = reports.map((report) {
      return PlutoRow(cells: {
        'report_id': PlutoCell(value: report.reportId.toString()),
        'report_time': PlutoCell(value: report.reportTime),
        'campus_name': PlutoCell(value: report.campusName),
        'campus_id': PlutoCell(value: report.campusId.toString()),
        'building': PlutoCell(value: report.building),
        'classroom_id': PlutoCell(value: report.classroomId.toString()),
        'classroom_name': PlutoCell(value: report.classroomName),
        'status': PlutoCell(value: report.status.toString()),
        'fault_desc': PlutoCell(
            value: ShadButton(
          text: const Text(
            '详情',
          ),
          onPressed: () => showShadSheet(
            side: ShadSheetSide.right,
            context: context,
            builder: (context) => RepairDetail(
              side: ShadSheetSide.right,
              reportDetail: report,
            ),
          ),
        )),
        'operation': PlutoCell(
            value: ShadButton(
          onPressed: () {
            final repairInfos = [
              (title: '维修开始时间', value: ''),
              (title: '维修结束时间', value: ''),
              (title: '维修详情', value: ''),
            ];
            showShadDialog(
              context: context,
              builder: (context) => ShadDialog(
                title: const Text('维修审批'),
                description: const Text(
                    "您现在正在进行维修审批操作，请仔细阅读维修申请信息，确认信息无误后进行审批。审批后将无法撤回，请谨慎操作！"),
                content: Container(
                  width: 375,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: repairInfos
                        .map(
                          (p) => Row(
                            children: [
                              Expanded(
                                child: Text(
                                  p.title,
                                  textAlign: TextAlign.end,
                                  style: context.theme.textTheme.labelMedium,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 3,
                                child: ShadInput(initialValue: p.value),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
                actions: const [ShadButton(text: Text('确认'))],
              ),
            );
          },
          text: Text("审批"),
        ))
      });
    }).toList();

    return plutoRows;
  }

  final RepairProv repairProv = ProvManager.repairProv;
  final bp = ProvManager.baseInfoProv;
  final NumberPaginatorController controller = NumberPaginatorController();

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

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      repairProv.searchReports();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<RepairProv, bool>(
      selector: (p0, p1) => p1.isStudentsNull,
      shouldRebuild: (previous, next) => previous = !next,
      builder: (context, isNull, child) {
        if (isNull) {
          return Center(
            child: const CircularProgressIndicator(),
          );
        } else {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100.h,
                  width: 700.w,
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
                                repairProv.setReqCampus(value.item2 - 1);
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
                        Selector<RepairProv, int>(
                          selector: (context, sp) => sp.selectedCampusInd,
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

                        // ShadSelect<Tuple2<int, int>>(
                        //   placeholder: Text(
                        //     '选择教室',
                        //     style: context.theme.textTheme.bodyMedium?.copyWith(
                        //       fontSize: 13.sp,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //   ),
                        //   options: getTextList(
                        //     [campusOptions],
                        //     context,
                        //   ),
                        //   onChanged: (value) {
                        //     print('@@@@@@@@@@@@@@$value');
                        //   },
                        //   selectedOptionBuilder:
                        //       (BuildContext context, Tuple2<int, int> value) {
                        //     return Text(
                        //       campusOptions.options[value.item2],
                        //       style: TextStyle(
                        //         fontSize: 16.sp,
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     );
                        //   },
                        // ),
                        ShadButton(
                          text: Text("查询"),
                          onPressed: () {
                            repairProv.searchReports().then((e) {
                              stateManager.removeAllRows();
                              List<PlutoRow> rows =
                                  getRowFromReports(repairProv.nowReports);
                              stateManager.insertRows(0, rows);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Selector<RepairProv, int>(
                  selector: (p0, p1) => p1.nowPageInd,
                  shouldRebuild: (previous, next) => previous != next,
                  builder: (context, pageNum, child) {
                    return Expanded(
                      flex: 7,
                      child: PlutoGrid(
                        columns: plutoColumns,
                        configuration: PlutoGridConfiguration(
                            style: PlutoTableUtil.gridStyleConfig(context)),
                        rows: getRowFromReports(repairProv.nowReports),
                        onLoaded: (e) => stateManager = e.stateManager,
                      ),
                    );
                  },
                ),
                Selector<RepairProv, int>(
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
                              numberPages: repairProv.pageTotal,
                              onPageChange: (int index) {
                                repairProv
                                    .setReqPageAndSearch(index)
                                    .then((onValue) {
                                  stateManager.removeAllRows();
                                  List<PlutoRow> rows =
                                      getRowFromReports(repairProv.nowReports);
                                  stateManager.insertRows(0, rows);
                                });
                              },
                              // initially selected index
                              initialPage: repairProv.nowPageInd,
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
            ),
          );
        }
      },
    );
  }
}
