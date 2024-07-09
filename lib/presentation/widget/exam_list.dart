import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ExamList extends StatefulWidget {
  const ExamList({Key? key}) : super(key: key);

  @override
  _ExamListState createState() => _ExamListState();
}

class _ExamListState extends State<ExamList> {
  final List<Exam> exams = [
    Exam(
      subject: '高等数学',
      time: '2024-01-10 14:00',
      location: '教学楼 101 室',
      type: '期末考试',
    ),
    Exam(
      subject: '线性代数',
      time: '2024-01-15 09:00',
      location: '教学楼 202 室',
      type: '期末考试',
    ),
    Exam(
      subject: '大学英语',
      time: '2024-01-20 16:00',
      location: '教学楼 303 室',
      type: '期末考试',
    ),
    Exam(
      subject: '计算机导论',
      time: '2024-01-25 10:00',
      location: '教学楼 404 室',
      type: '期末考试',
    ),
    Exam(
      subject: '程序设计',
      time: '2024-02-01 14:00',
      location: '教学楼 505 室',
      type: '期末考试',
    ),
    Exam(
      subject: '程序设计',
      time: '2024-02-01 14:00',
      location: '教学楼 505 室',
      type: '期末考试',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
            flex: 4,
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exams[index].subject,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.calendar_today),
                          title: Text('考试时间'),
                          subtitle: Text(exams[index].time),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.location_on),
                          title: Text('考试地点'),
                          subtitle: Text(exams[index].location),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.assignment),
                          title: Text('考试类型'),
                          subtitle: Text(exams[index].type),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
        Flexible(
            flex: 2,
            child: Column(
              children: [
                ShadAlert(
                  iconSrc: LucideIcons.bookOpenCheck,
                  title: Text('考试提醒'),
                  description: Text(
                      '接下来的考试是计算机导论，考试时间是2024-02-01 14:00，考试地点是教学楼 505 室。'),
                ),
                ShadAlert(
                  iconSrc: LucideIcons.bookOpenCheck,
                  title: Text('考试提醒'),
                  description: Text(
                      '接下来的考试是计算机导论，考试时间是2024-02-01 14:00，考试地点是教学楼 505 室。'),
                ),
                ShadAlert(
                  iconSrc: LucideIcons.bookOpenCheck,
                  title: Text('考试提醒'),
                  description: Text(
                      '接下来的考试是计算机导论，考试时间是2024-02-01 14:00，考试地点是教学楼 505 室。'),
                ),
              ],
            ))
      ],
    );
  }
}

class Exam {
  final String subject;
  final String time;
  final String location;
  final String type;

  Exam({
    required this.subject,
    required this.time,
    required this.location,
    required this.type,
  });
}
