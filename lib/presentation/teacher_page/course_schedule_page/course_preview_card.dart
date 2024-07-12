import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/presentation/main_dashboard.dart';
import 'package:smart_edu/presentation/widget/course_detail_page.dart';
import 'package:smart_edu/style/style_scheme.dart';

//单个课程预览卡片
class CoursePreviewCard extends StatefulWidget {
  const CoursePreviewCard({Key? key}) : super(key: key);

  @override
  _CoursePreviewCardState createState() => _CoursePreviewCardState();
}

class _CoursePreviewCardState extends State<CoursePreviewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
      height: 170.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text("📚"),
              Text(
                '课程名称',
                style: context.theme.textTheme.titleMedium,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text('软工2201班',
                  style: context.theme.textTheme.bodySmall?.copyWith(
                    color: Color.fromARGB(255, 105, 105, 105),
                  )),
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: Icon(
                          Icons.check_circle_outline,
                          size: 20.r,
                        ),
                      ),
                      Text(
                        "课程学分：4  教授年级：大三",
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          color: Color.fromARGB(255, 105, 105, 105),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text("课程类型：必修课",
                      style: context.theme.textTheme.bodySmall?.copyWith(
                        color: Color.fromARGB(255, 105, 105, 105),
                      )),
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            margin: EdgeInsets.symmetric(vertical: 10.h),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white12, Colors.transparent],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
              border: Border(
                  left: BorderSide(
                      color: Color.fromARGB(255, 0, 127, 255), width: 1)),
            ),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Icon(
                      Icons.calendar_today,
                      color: Color.fromARGB(255, 0, 127, 255),
                    )),
                Text('课程周期： 2024年上学年'),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainDashboard(
                            subWidget: CourseDetailPage(courseTitle: "马克思主义原理"),
                          ),
                        ));
                  },
                  child: const Text(
                    "详情",
                    style: TextStyle(
                      color: Color.fromARGB(200, 0, 127, 255),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
