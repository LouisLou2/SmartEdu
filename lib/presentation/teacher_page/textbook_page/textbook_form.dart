import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/presentation/teacher_page/textbook_page/textbook_info.dart';

class TextbookForm extends StatefulWidget {
  const TextbookForm({Key? key}) : super(key: key);

  @override
  _TextbookFormState createState() => _TextbookFormState();
}

class _TextbookFormState extends State<TextbookForm> {
  final _formKey = GlobalKey<FormState>();
  TextBookModel? _textBookModel;
  @override
  Widget build(BuildContext context) {
    return ShadForm(
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
                      child: Icon(LucideIcons.bookDown),
                    ),
                    Text("教材申请", style: TextStyle(fontSize: 20)),
                  ],
                )),
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 1,
                  child: ShadInputFormField(
                    id: "isbn",
                    placeholder: const Text("输入ISBN"),
                    label: const Text("ISBN"),
                    onSaved: (value) {
                      _textBookModel?.setIsbn = value ?? "";
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: ShadInputFormField(
                    id: "title",
                    placeholder: const Text("输入教材名称"),
                    label: const Text("教材名称"),
                    onSaved: (value) {
                      _textBookModel?.setTitle = value ?? "";
                    },
                  ),
                )
              ],
            ),
            ShadInputFormField(
              id: "author",
              placeholder: const Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(LucideIcons.userCog)),
                  const Text("输入作者"),
                ],
              ),
              label: const Text("作者"),
              onSaved: (value) {
                _textBookModel?.setAuthor = value ?? "";
              },
            ),
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(Icons.arrow_right)),
                const Text("请从下拉框中选择出版社"),
                const Spacer(),
                ShadSelect<String>(
                  placeholder: const Text("输入出版社"),
                  options: getPubliserOptions(),
                  selectedOptionBuilder: (context, value) {
                    return Text(value);
                  },
                ),
              ],
            ),
            ShadInputFormField(
              id: "edition",
              placeholder: const Text("输入版本"),
              label: const Text("版本"),
              onSaved: (value) {
                _textBookModel?.setEdition = value ?? "";
              },
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                    child: Column(
                  children: [
                    ShadInputFormField(
                      id: "pubDate",
                      placeholder: const Text("输入出版日期"),
                      label: const Text("出版日期"),
                      onSaved: (value) {
                        _textBookModel?.setPubDate =
                            DateTime.parse(value ?? "");
                      },
                    ),
                    ShadInputFormField(
                      id: "coverUrl",
                      placeholder: const Text("输入封面链接"),
                      label: const Text("封面链接"),
                      onSaved: (value) {
                        _textBookModel?.setCoverUrl = value ?? "";
                      },
                    ),
                  ],
                )),
                Flexible(child: TextbookInfo()),
              ],
            ),
            SizedBox(height: 20.sp),
            ShadButton(
              text: Text("提交申请"),
              onPressed: () {},
            ),
          ],
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
