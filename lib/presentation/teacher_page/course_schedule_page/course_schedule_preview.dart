import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_edu/presentation/teacher_page/course_schedule_page/course_info_card.dart';
import 'package:smart_edu/presentation/teacher_page/course_schedule_page/course_preview_card.dart';

//教师课程列表预览页面
class CourseSchedulePreview extends StatefulWidget {
  const CourseSchedulePreview({Key? key}) : super(key: key);

  @override
  _CourseSchedulePreviewState createState() => _CourseSchedulePreviewState();
}

class _CourseSchedulePreviewState extends State<CourseSchedulePreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Flexible(
            flex: 3,
            child: ListView(
              children: [
                CoursePreviewCard(),
                CoursePreviewCard(),
                CoursePreviewCard(),
                CoursePreviewCard(),
                CoursePreviewCard(),
                CoursePreviewCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
