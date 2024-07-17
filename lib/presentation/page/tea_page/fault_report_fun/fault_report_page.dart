import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/extension/context_extension.dart';

import '../../../widget/upload_file_dialog.dart';

class FaultReportPage extends StatefulWidget {
  const FaultReportPage({Key? key}) : super(key: key);

  @override
  _TextbookApplicationState createState() => _TextbookApplicationState();
}

class _TextbookApplicationState extends State<FaultReportPage> {

  final _formKey = GlobalKey<FormState>();
  TextBookModel? _textBookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.w),
        child:  ShadForm(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 20.sp),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(LucideIcons.wrench),
                      ),
                      Text("故障申报", style: TextStyle(fontSize: 20)),
                    ],
                  )),
              Container(
                width: 800.w,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      flex: 1,
                      child: ShadInputFormField(
                        id: "name",
                        placeholder: const Text("申请人"),
                        label: const Row(
                          children: [
                            Icon(LucideIcons.user),
                            Text("申请教师"),
                          ],
                        ),
                        onSaved: (value) {
                          _textBookModel?.setIsbn = value ?? "";
                        },
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: ShadInputFormField(
                        id: "phone_number",
                        placeholder: const Text("联系电话"),
                        label: const Row(
                          children: [
                            Icon(LucideIcons.phone),
                            Text("联系电话"),
                          ],
                        ),
                        onSaved: (value) {
                          _textBookModel?.setTitle = value ?? "";
                        },
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(Icons.arrow_right)),
                  const Text("请从下拉框中选择需维修的教室"),
                  const Spacer(),
                  ShadSelect<String>(
                    placeholder: Row(
                      children: [
                        Icon(LucideIcons.school),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("校区"),
                      ],
                    ),
                    options: getPubliserOptions(),
                    selectedOptionBuilder: (context, value) {
                      return Text(value);
                    },
                  ),
                  ShadSelect<String>(
                    placeholder: Row(
                      children: [
                        Icon(LucideIcons.building),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("楼栋"),
                      ],
                    ),
                    options: getPubliserOptions(),
                    selectedOptionBuilder: (context, value) {
                      return Text(value);
                    },
                  ),
                  ShadSelect<String>(
                    placeholder: Row(
                      children: [
                        Icon(LucideIcons.building2),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("教室"),
                      ],
                    ),
                    options: getPubliserOptions(),
                    selectedOptionBuilder: (context, value) {
                      return Text(value);
                    },
                  ),
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                      child: Column(
                        children: [
                          ShadInputFormField(
                            id: "fault_desc",
                            placeholder: const Text("问题描述"),
                            label: Row(
                              children: [
                                const Icon(LucideIcons.circleHelp),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Text("问题描述"),
                              ],
                            ),
                            maxLines: 10,
                            minLines: 10,
                            onSaved: (value) {
                              // _textBookModel?.setPubDate =
                              //     DateTime.parse(value ?? "");
                            },
                          ),
                        ],
                      )),
                  Flexible(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '故障申报须知',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: context.theme.colorScheme.primary,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                '1. 请提供详细的故障描述，包括故障现象和可能的原因。\n'
                                    '2. 每次申报请针对一个故障点进行，以便于我们解决。\n'
                                    '3. 提交申报后，我们将尽快与您联系，并提供进一步的指导。',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 30.h),
                              Center(
                                child: ShadButton(
                                  text: Text("查看故障申报记录"),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(height: 20.sp),
              Center(
                child: ShadButton(
                  text: Text("提交申请"),
                  onPressed: () {
                    showShadDialog(
                        context: context,
                        builder: (context) {
                          return UploadFileDialog();
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      )
      ),
    );
  }
  final publishers = {
    '北京市': {
      '清华大学出版社': '清华大学出版社',
      '北京大学出版社': '北京大学出版社',
    },
    '湖南省': {
      '湖南文艺出版社': '湖南文艺出版社',
      '湖南美术出版社': '湖南美术出版社',
      '中南大学出版社': '中南大学出版社',
    },
  };
  List<Widget> getPubliserOptions() {
    final widgets = <Widget>[];
    for (final publisher in publishers.entries) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
          child: Text(
            publisher.key,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      );
      widgets.addAll(publisher.value.entries
          .map((e) => ShadOption(value: e.key, child: Text(e.value))));
    }
    return widgets;
  }
}
class TextBookModel {
  String isbn;
  String title;
  String author;
  String publisher;
  String edition;
  DateTime pubDate;
  String coverUrl;

  TextBookModel({
    required this.isbn,
    required this.title,
    required this.author,
    required this.publisher,
    required this.edition,
    required this.pubDate,
    required this.coverUrl,
  });
  set setIsbn(String isbn) {
    this.isbn = isbn;
  }

  set setTitle(String title) {
    this.title = title;
  }

  set setAuthor(String author) {
    this.author = author;
  }

  set setPublisher(String publisher) {
    this.publisher = publisher;
  }

  set setEdition(String edition) {
    this.edition = edition;
  }

  set setPubDate(DateTime pubDate) {
    this.pubDate = pubDate;
  }

  set setCoverUrl(String coverUrl) {
    this.coverUrl = coverUrl;
  }
}