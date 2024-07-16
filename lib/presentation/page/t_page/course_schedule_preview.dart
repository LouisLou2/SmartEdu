import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'course_preview_card.dart';

//教师课程列表预览页面
class CourseSchedulePreview extends StatefulWidget {
  const CourseSchedulePreview({super.key});

  @override
  State<CourseSchedulePreview> createState() => _CourseSchedulePreviewState();
}

class _CourseSchedulePreviewState extends State<CourseSchedulePreview> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Flexible(
            flex: 3,
            child: ListView(
              children: const [
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
