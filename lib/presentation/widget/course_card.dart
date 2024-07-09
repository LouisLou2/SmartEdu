import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_edu/presentation/main_dashboard.dart';
import 'package:smart_edu/presentation/page/main_panel.dart';
import 'package:smart_edu/presentation/widget/course_detail_page.dart';

class CourseCard extends StatefulWidget {
  const CourseCard({Key? key}) : super(key: key);

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  // 模拟课程数据列表
  List<Course> courses = [
    Course(
        name: "计算机网络",
        department: "计算机学院",
        startDate: "2024-01",
        endDate: "2024-07",
        credit: 4,
        isElective: true,
        teacher: "罗嘉烨",
        semester: "大二下"),

    Course(
        name: "数据结构",
        department: "计算机学院",
        startDate: "2024-01",
        endDate: "2024-07",
        credit: 4,
        isElective: true,
        teacher: "罗嘉烨",
        semester: "大二下"),

    Course(
        name: "数据结构",
        department: "计算机学院",
        startDate: "2024-01",
        endDate: "2024-07",
        credit: 4,
        isElective: true,
        teacher: "罗嘉烨",
        semester: "大二下"),

    Course(
        name: "数据结构",
        department: "计算机学院",
        startDate: "2024-01",
        endDate: "2024-07",
        credit: 4,
        isElective: true,
        teacher: "罗嘉烨",
        semester: "大二下"),

    Course(
        name: "数据结构",
        department: "计算机学院",
        startDate: "2024-01",
        endDate: "2024-07",
        credit: 4,
        isElective: true,
        teacher: "罗嘉烨",
        semester: "大二下"),
    // ... 添加更多课程数据
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: courses.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 10.r),
        itemBuilder: (context, index) {
          return getCardItem(courses[index]);
        });
  }

  // 使用Course类封装卡片内容
  Widget getCardItem(Course course) {
    return Card(
      margin: EdgeInsets.all(10.0.h),
      child: Container(
          padding: EdgeInsets.all(15.0.h),
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.name,
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0.h),
                Text(course.department),
                SizedBox(height: 5.0.h),
                Text('开课: ${course.startDate}  -  结课: ${course.endDate}'),
                SizedBox(height: 5.0.h),
                Text('学分数: ${course.credit}'),
                SizedBox(height: 5.0.h),
                Text('必选修: ${course.isElective ? '必修' : '选修'}'),
                SizedBox(height: 5.0.h),
                Text('授课教师: ${course.teacher}'),
                SizedBox(height: 10.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(course.semester),
                    SizedBox(width: 180.0.h), // 添加 SizedBox，设置宽度为10个高度单位

                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainDashboard(
                                subWidget:
                                    CourseDetailPage(courseTitle: "马克思主义原理"),
                              ),
                            ));
                      },
                      child: const Text(
                        "详情",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class Course {
  final String name;
  final String department;
  final String startDate;
  final String endDate;
  final int credit;
  final bool isElective;
  final String teacher;
  final String semester;

  Course({
    required this.name,
    required this.department,
    required this.startDate,
    required this.endDate,
    required this.credit,
    required this.isElective,
    required this.teacher,
    required this.semester,
  });
}
