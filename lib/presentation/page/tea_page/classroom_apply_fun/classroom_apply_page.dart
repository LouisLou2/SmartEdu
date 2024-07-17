import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/extension/context_extension.dart';

class ClassroomApplyPage extends StatefulWidget {
  const ClassroomApplyPage({Key? key}) : super(key: key);

  @override
  _TextbookFormState createState() => _TextbookFormState();
}

class _TextbookFormState extends State<ClassroomApplyPage> {
  final _formKey = GlobalKey<FormState>();
  TextBookModel? _textBookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.w),
        child: ShadForm(
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
                          child: Icon(LucideIcons.school),
                        ),
                        Text("教室预约", style: TextStyle(fontSize: 20)),
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
                    const Text("请从下拉框中选择预约的教室"),
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
                    SizedBox(
                      width: 20.w,
                    ),
                    ShadBadge.raw(
                        backgroundColor: Colors.green,
                        variant: ShadBadgeVariant.destructive,
                        text: Text("该时段教室可预约")),
                  ],
                ),
                Container(
                  height: 100.h,
                  width: 800.w,
                  alignment: Alignment.center,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                          flex: 1,
                          child: ShadInputFormField(
                            label: const Text("年份"),
                            placeholder: const Icon(
                              Icons.calendar_month,
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          child: ShadInputFormField(
                            label: const Text("周次"),
                            placeholder: const Icon(LucideIcons.calendarCheck),
                          )),
                      Flexible(
                          flex: 1,
                          child: ShadInputFormField(
                            label: const Text("星期"),
                            placeholder: const Icon(LucideIcons.calendarDays),
                          )),
                      Flexible(
                          flex: 1,
                          child: ShadInputFormField(
                            label: const Text("开始时间"),
                            placeholder: const Icon(LucideIcons.calendarClock),
                          )),
                      Flexible(
                          flex: 1,
                          child: ShadInputFormField(
                            label: const Text("结束时间"),
                            placeholder: const Icon(LucideIcons.calendarClock),
                          )),
                    ],
                  ),
                ),
                Row(
                  children: [
                    ShadSelect<String>(
                      placeholder: Row(
                        children: [
                          Icon(LucideIcons.messageCircleQuestion),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Text("原因类型"),
                        ],
                      ),
                      options: getPubliserOptions(),
                      selectedOptionBuilder: (context, value) {
                        return Text(value);
                      },
                    ),
                    Expanded(
                        child: ShadInputFormField(
                      placeholder: Text("活动描述"),
                    ))
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
                          placeholder: const Text("原因详细描述"),
                          label: Row(
                            children: [
                              const Icon(LucideIcons.info),
                              SizedBox(
                                width: 5.w,
                              ),
                              const Text("详细描述"),
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
                              '教室预约须知',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: context.theme.colorScheme.primary,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              '1. 每次预约请只申请一个时间段，避免资源浪费。\n'
                              '2. 请提前规划您的预约时间，确保有足够的时间准备和使用教室\n'
                              '3. 请爱护教室设施，保持教室整洁。',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 30.h),
                            Center(
                              child: ShadButton(
                                text: Text("查看你的预约记录"),
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
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //按地区分类出版社
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
