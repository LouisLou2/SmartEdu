import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_edu/extension/context_extension.dart';

//右侧教师课程信息的大致预览（XXX教了多少门课，接下来的上课时间）

class CourseInfoCard extends StatefulWidget {
  const CourseInfoCard({Key? key}) : super(key: key);

  @override
  _CourseInfoCardState createState() => _CourseInfoCardState();
}

class _CourseInfoCardState extends State<CourseInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Text("本学期你共教授了5节课", style: context.theme.textTheme.titleMedium),
                Spacer(),
                Icon(Icons.arrow_upward)
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color.fromARGB(255, 245, 245, 245)),
                    child: Text(
                      '🏫',
                      style: context.theme.textTheme.titleLarge,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
