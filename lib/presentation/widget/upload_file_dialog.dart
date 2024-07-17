import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/extension/context_extension.dart';

class UploadFileDialog extends StatelessWidget {
  const UploadFileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: const Text("上传教学文件"),
      content: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
          child: Column(
            children: [
              Column(children: [
                DottedBorder(
                  strokeWidth: 1, // 边框宽度
                  color: Colors.grey, // 边框颜色
                  borderType: BorderType.RRect, // 边框类型，可选RRect、Circle等
                  radius: Radius.circular(10), // 边框圆角半径
                  dashPattern: [5, 5], // 虚线模式，第一个数字表示虚线长度，第二个数字表示间隔长度
                  child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 200.h,
                      color: context.theme.colorScheme.primaryContainer
                          .withOpacity(0.3),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, size: 30, color: Colors.grey),
                          ShadButton.link(
                            text: Text("点击上传文件",
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10.h),
                    height: 40.h,
                    width: double.infinity,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("支持格式：Word、PDF、PPT等",
                            style: TextStyle(color: Colors.grey)),
                        Text("Max Size:25MB",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5), // 设置淡淡的边框颜色
                      width: 1, // 设置边框宽度
                    ),
                  ),
                  height: 120.h,
                  child: const Column(
                    children: <Widget>[
                      Material(
                        child: ListTile(
                          leading: Icon(LucideIcons.file),
                          title: Text("file name"),
                          subtitle: Text("file size"),
                        ),
                      ),
                      LinearProgressIndicator(
                        value:
                            0.5, // Replace with the actual progress value (between 0 and 1)
                      )
                    ],
                  ),
                )
              ]),
            ],
          )),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(LucideIcons.circleHelp),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  "帮助中心",
                  style: context.theme.textTheme.labelLarge,
                ),
                SizedBox(
                  width: 3.w,
                ),
              ],
            ),
            ShadButton(
              text: Text("提交"),
              onPressed: () async {
                // print("上传教学资料");
              },
            )
          ],
        )
      ],
    );
  }

  //选择文件
  Future<String> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      File uploadFile = File(result.files.single.path!);

      print(file.name); // 打印文件名
      print(file.size); // 打印文件大小
      print(uploadFile.uri.toFilePath());
      return Future.value(uploadFile.uri.toFilePath());
    } else {
      return Future.value("");
    }
  }

  //上传文件
  Future<void> uploadFile(String url) async {
    Dio dio = Dio();

    String filePath = await pickFile();
    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(filePath),
      });

      Response response = await dio.post(
        url,
        data: formData,
        onSendProgress: (sent, total) {
          print('Upload Progress: ${(sent / total * 100).toStringAsFixed(0)}%');
        },
      );

      print('Upload Complete: ${response.data}');
    } catch (e) {
      print('Upload Error: $e');
    }
  }
}
