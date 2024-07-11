import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/style/style_scheme.dart';

class ExamApplicationForm extends StatefulWidget {
  const ExamApplicationForm({Key? key}) : super(key: key);

  @override
  _ExamApplicationFormState createState() => _ExamApplicationFormState();
}

class _ExamApplicationFormState extends State<ExamApplicationForm> {
  final _examType = {
    '普通考试': '普通考试',
    '重修考试': '重修考试',
    '补考': '补考',
  };
  // style: context.theme.textTheme.titleMedium?.copyWith(
  //                         fontWeight: FontWeight.w500,
  //                         fontFamily: StyleScheme.engFontFamily,
  //                         fontSize: 18.sp,
  //                       )
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        children: [
          ShadCard(
            title: Text("考试预约信息",
                style: context.theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontFamily: StyleScheme.engFontFamily,
                  fontSize: 18.sp,
                )),
            // description: const Text("请选择考试具体的教师、课程、教学班及考试类型"),
            content: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100.w,
                    ),
                    getInfoAndBtnWidget(
                        info: '教室预约',
                        btnText: '查看教室',
                        onPressed: () {},
                        icon: const Icon(LucideIcons.school)),
                    getInfoAndBtnWidget(
                        info: '课程选择',
                        btnText: '查看课程',
                        icon: const Icon(LucideIcons.bookKey),
                        onPressed: () {}),
                    getInfoAndBtnWidget(
                        info: '教学班选择',
                        btnText: '查看班级',
                        icon: const Icon(LucideIcons.users),
                        onPressed: () {}),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ShadBadge.outline(text: Text('考试类型')),
                        Container(
                          child: ShadSelect<String>(
                            placeholder: const Text("选择类型"),
                            options: [
                              ..._examType.entries.map((e) => ShadOption(
                                    value: e.key,
                                    selectedIcon: Padding(
                                      padding: EdgeInsets.only(right: 8.w),
                                      child: const Icon(LucideIcons.dot),
                                    ),
                                    child: Text(e.value),
                                  )),
                            ],
                            selectedOptionBuilder: (context, value) =>
                                Text(_examType[value] ?? ""),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                //考试时长相关的输入框(duration term_part week  day_of_week period_from)
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
                          label: const Text("考试时长"),
                          placeholder: const Icon(LucideIcons.hourglass),
                        ),
                      ),
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
                    ],
                  ),
                ),
                getFileUploadWidget(),
                Container(
                  width: 200.h,
                  alignment: Alignment.center,
                  child: const ShadButton.secondary(
                    text: Text("提交考试信息"),
                    onPressed: null,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //上传文件按钮、文件描述文本框
  Widget getFileUploadWidget() {
    return Container(
      constraints: BoxConstraints(maxHeight: 250.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const ShadButton.secondary(
            icon: Icon(LucideIcons.fileArchive),
            text: Text("上传文件"),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 180.h),
            child: ShadInputFormField(
              minLines: 5,
              maxLines: 10,
              placeholder: const Text("输入考试试卷描述"),
            ),
          )
        ],
      ),
    );
  }

  //选择课程、教室预约等四个按钮
  Widget getInfoAndBtnWidget(
      {String? info, String? btnText, Function()? onPressed, Icon? icon}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShadBadge.outline(text: Text('$info')),
        ShadButton.outline(
          hoverBackgroundColor:
              context.theme.colorScheme.primary.withOpacity(0.1),
          icon: Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: icon ?? const Icon(Icons.undo),
          ),
          onPressed: onPressed ?? () {},
          text: Row(children: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Text('$btnText'),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 20.w,
            ),
          ]),
        ),
      ],
    );
  }
}
