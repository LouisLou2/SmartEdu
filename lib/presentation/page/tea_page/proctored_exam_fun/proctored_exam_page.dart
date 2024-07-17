import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/extension/context_extension.dart';

class ProctoredExamPage extends StatefulWidget {
  const ProctoredExamPage({Key? key}) : super(key: key);

  @override
  _ProctoredExamPageState createState() => _ProctoredExamPageState();
}

class _ProctoredExamPageState extends State<ProctoredExamPage> {
  final List<ProctoredExamModel> proctoredExamList = [
    ProctoredExamModel(
      courseInstId: 1,
      courseName: '课程1',
      time: DateTime.now(),
      campusName: '校区1',
      building: '楼栋1',
      classroomName: '教室1',
      assessMethod: '考试',
    ),
    ProctoredExamModel(
      courseInstId: 2,
      courseName: '课程2',
      time: DateTime.now(),
      campusName: '校区2',
      building: '楼栋2',
      classroomName: '教室2',
      assessMethod: '考试',
    ),
    ProctoredExamModel(
      courseInstId: 3,
      courseName: '课程3',
      time: DateTime.now(),
      campusName: '校区3',
      building: '楼栋3',
      classroomName: '教室3',
      assessMethod: '考试',
    ),
    ProctoredExamModel(
      courseInstId: 4,
      courseName: '课程4',
      time: DateTime.now(),
      campusName: '校区4',
      building: '楼栋4',
      classroomName: '教室4',
      assessMethod: '考试',
    ),
    ProctoredExamModel(
      courseInstId: 5,
      courseName: '课程5',
      time: DateTime.now(),
      campusName: '校区5',
      building: '楼栋5',
      classroomName: '教室5',
      assessMethod: '考试',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.r),
        color: context.theme.colorScheme.surface,
        child: getClassRomeList());
  }

  Widget getClassRomeList() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "监考列表",
            style: context.theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              const Icon(LucideIcons.searchCode),
              ShadBadge.outline(
                text: const Text('Invigilation list'),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 500.h,
            child: ShadTable.list(
              header: const [
                //课程号、课程名、考试时间、校区、楼栋、教室、考核方式
                ShadTableCell.header(child: Text('课程号')),
                ShadTableCell.header(child: Text('课程名')),
                ShadTableCell.header(child: Text('考试时间')),
                ShadTableCell.header(child: Text('校区')),
                ShadTableCell.header(child: Text('楼栋')),
                ShadTableCell.header(child: Text('教室')),
                ShadTableCell.header(child: Text('考核方式')),
              ],
              columnSpanExtent: (index) {
                return FixedTableSpanExtent(200.w);
              },
              children: proctoredExamList.map(
                (proctoredExam) => [
                  ShadTableCell(
                    child: Text(
                      proctoredExam.courseInstId.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ShadTableCell(child: Text(proctoredExam.courseName ?? "")),
                  ShadTableCell(
                      child: Text(
                          timeShowFomat(proctoredExam.time ?? DateTime.now()))),
                  ShadTableCell(child: Text(proctoredExam.campusName ?? "")),
                  ShadTableCell(child: Text(proctoredExam.building ?? "")),
                  ShadTableCell(child: Text(proctoredExam.classroomName ?? "")),
                  ShadTableCell(child: Text(proctoredExam.assessMethod ?? "")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String timeShowFomat(DateTime time) {
    return "${time.year}-${time.month}-${time.day} ${time.hour}:${time.minute}";
  }
}

class ProctoredExamModel {
  num? courseInstId;
  String? courseName;
  DateTime? time;
  String? campusName;
  String? building;
  String? classroomName;
  String? assessMethod;

  ProctoredExamModel({
    this.courseInstId,
    this.courseName,
    this.time,
    this.campusName,
    this.building,
    this.classroomName,
    this.assessMethod,
  });
}
