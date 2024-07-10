import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TextbookInfo extends StatefulWidget {
  const TextbookInfo({Key? key}) : super(key: key);

  @override
  _TextbookInfoState createState() => _TextbookInfoState();
}

class _TextbookInfoState extends State<TextbookInfo> {
  //课本数量
  int textbookCount = 0;
  //课程数量
  int courseCount = 0;
  //学生数量
  int studentCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ShadCard(
        description: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("这里统计了学校课程"), Text("教材数量、课程数量、学生数量")],
        ),
        content: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(LucideIcons.hash)),
                Text("教材数量: $textbookCount"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(LucideIcons.squareMinus)),
                Text("课程数量: $courseCount"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(LucideIcons.circleDashed)),
                Text("学生数量: $studentCount"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
