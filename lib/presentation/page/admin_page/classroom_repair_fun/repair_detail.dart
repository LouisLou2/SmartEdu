import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/domain/entity/repair_report_model.dart';

class RepairDetail extends StatelessWidget {
  RepairDetail({Key? key, required this.side, this.reportDetail})
      : super(key: key);
  final ShadSheetSide side;
  Report? reportDetail;
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadSheet(
      constraints: side == ShadSheetSide.left || side == ShadSheetSide.right
          ? const BoxConstraints(maxWidth: 512)
          : null,
      title: const Text('申报详情'),
      content: Material(
          child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(CupertinoIcons.number),
            title:
                Text('报修单号: ${reportDetail?.reportIdValue.toString() ?? ""}'),
          ),
          SizedBox(height: 10.h),
          ListTile(
            leading: Icon(CupertinoIcons.calendar),
            title: Text('报修时间: ${reportDetail?.reportTimeValue ?? ""}'),
          ),
          SizedBox(height: 10.h),
          ListTile(
            leading: Icon(CupertinoIcons.building_2_fill),
            title: Text('校区: ${reportDetail?.campusNameValue ?? ""}'),
          ),
          SizedBox(height: 10.h),
          ListTile(
            leading: Icon(CupertinoIcons.number),
            title:
                Text('校区编号: ${reportDetail?.campusIdValue.toString() ?? ""}'),
          ),
          SizedBox(height: 10.h),
          ListTile(
            leading: Icon(CupertinoIcons.building_2_fill),
            title: Text('建筑: ${reportDetail?.buildingValue ?? ""}'),
          ),
          SizedBox(height: 10.h),
          ListTile(
            leading: Icon(CupertinoIcons.number),
            title: Text('教室号: ${reportDetail?.classroomIdValue ?? ""}'),
          ),
          SizedBox(height: 10.h),
          ListTile(
            leading: Icon(CupertinoIcons.location),
            title: Text('故障描述: ${reportDetail?.classroomNameValue ?? ""}'),
          ),
          SizedBox(height: 10.h),
          ListTile(
            leading: Icon(CupertinoIcons.building_2_fill),
            title: Text('故障描述: ${reportDetail?.faultDescValue ?? ""}'),
          ),
          ShadAlert(
            iconSrc: CupertinoIcons.star,
            title: Text("具体描述"),
            description: Text('${reportDetail?.faultDescValue ?? "无"}'),
          ),
        ],
      )),
      actions: const [
        ShadButton(text: Text('关闭')),
      ],
    );
  }
}
