import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/presentation/teacher_page/textbook_page/textbook_form.dart';
import 'package:smart_edu/presentation/teacher_page/textbook_page/textbook_info.dart';

class TextbookApplication extends StatefulWidget {
  const TextbookApplication({Key? key}) : super(key: key);

  @override
  _TextbookApplicationState createState() => _TextbookApplicationState();
}

class _TextbookApplicationState extends State<TextbookApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            _buildInfoCard(),
            SizedBox(height: 20.h),
            Flex(direction: Axis.horizontal, children: [
              Expanded(
                flex: 3,
                child: TextbookForm(),
              ),
            ])
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '教材申请须知',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              '1. 请填写所有必要的信息以确保申请顺利提交。\n'
              '2. 每次申请只能提交一本教材的信息。\n'
              '3. 请确保相关图书准确，以便我们教材存储无误。',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
