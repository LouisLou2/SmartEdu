import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ClassroomApplication extends StatefulWidget {
  const ClassroomApplication({Key? key}) : super(key: key);

  @override
  _ClassroomApplicationState createState() => _ClassroomApplicationState();
}

class _ClassroomApplicationState extends State<ClassroomApplication> {
  final List<ClassroomApplicationModel> classroomList = [
    ClassroomApplicationModel(
      classroomName: '教室1',
      campus: '校区1',
      classroomType: '普通教室',
      capacity: 100,
      status: '空闲',
    ),
    ClassroomApplicationModel(
      classroomName: '教室2',
      campus: '校区2',
      classroomType: '普通教室',
      capacity: 100,
      status: '空闲',
    ),
    ClassroomApplicationModel(
      classroomName: '教室3',
      campus: '校区3',
      classroomType: '普通教室',
      capacity: 100,
      status: '空闲',
    ),
    ClassroomApplicationModel(
      classroomName: '教室4',
      campus: '校区4',
      classroomType: '普通教室',
      capacity: 100,
      status: '空闲',
    ),
    ClassroomApplicationModel(
      classroomName: '教室5',
      campus: '校区5',
      classroomType: '普通教室',
      capacity: 100,
      status: '空闲',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ShadTabs<String>(
      defaultValue: 'account',
      tabs: [
        ShadTab(
            value: 'account',
            text: const Text('教室申请'),
            content: ShadCard(
                rowMainAxisAlignment: MainAxisAlignment.center,
                rowCrossAxisAlignment: CrossAxisAlignment.center,
                description: const Text("请至少提前3天提交申请，以便我们有足够的时间进行审核。"),
                content: getClassRomeList())),
        ShadTab(
          value: 'password',
          text: const Text('故障维修'),
          content: ShadCard(
            content: getMaintainRequset(),
          ),
        ),
      ],
    );
  }

  Widget getMaintainRequset() {
    return Container(
        constraints: BoxConstraints(maxWidth: 1200.w),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
                flex: 4,
                child: Column(
                  children: [
                    ShadInputFormField(
                      label: const Text('教室号'),
                    ),
                    ShadInputFormField(
                      label: const Text('故障类型'),
                    ),
                    ShadInputFormField(
                      label: const Text('详细描述'),
                      maxLines: 4,
                    ),
                    ShadInputFormField(
                      label: const Text('提交人姓名'),
                    ),
                    ShadInputFormField(
                      label: const Text('联系方式'),
                    ),
                    ShadButton(
                      text: const Text('提交申请'),
                      onPressed: () {},
                    ),
                  ],
                )),
            Flexible(
                flex: 2,
                child: Column(
                  children: [
                    ShadAlert(
                      iconSrc: LucideIcons.shieldAlert,
                      title: Text('故障维修提醒'),
                      description:
                          Text('请提供教室位置、问题描述等信息；我们会尽快处理您的请求，并与您联系以安排维修时间。'),
                    ),
                  ],
                ))
          ],
        ));
  }

  Widget getClassRomeList() {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              const Icon(LucideIcons.school),
              ShadBadge.outline(
                text: const Text('教室列表'),
              ),
              Spacer(),
              ShadButton(
                text: const Text('申请记录'),
                icon: const Padding(
                    padding: EdgeInsets.only(right: 9),
                    child: Icon(Icons.history)),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('申请记录'),
                        content: const Text('申请记录内容'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('确定'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 500.h,
            child: ShadTable.list(
              header: const [
                //教室名、所在校区、教室类型、教室容量、教室状态
                ShadTableCell.header(child: Text('教室名')),
                ShadTableCell.header(child: Text('所在校区')),
                ShadTableCell.header(child: Text('教室类型')),
                ShadTableCell.header(child: Text('容量')),
                ShadTableCell.header(child: Text('状态')),
                ShadTableCell.header(child: Text('操作')),
              ],
              columnSpanExtent: (index) {
                return FixedTableSpanExtent(200.w);
              },
              children: classroomList.map(
                (classroom) => [
                  ShadTableCell(
                    child: Text(
                      classroom.classroomName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ShadTableCell(child: Text(classroom.campus)),
                  ShadTableCell(child: Text(classroom.classroomType)),
                  ShadTableCell(child: Text(classroom.capacity.toString())),
                  ShadTableCell(child: Text(classroom.status)),
                  ShadTableCell(
                    child: OutlinedButton(
                      child: const Text('申请'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClassroomApplicationModel {
  //教室名、所在校区、教室类型、教室容量、教室状态
  final String classroomName;
  final String campus;
  final String classroomType;
  final int capacity;
  final String status;

  ClassroomApplicationModel({
    required this.classroomName,
    required this.campus,
    required this.classroomType,
    required this.capacity,
    required this.status,
  });
}
