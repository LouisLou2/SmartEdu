import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:smart_edu/style/style_scheme.dart';

class PaginationBar extends StatefulWidget {
  const PaginationBar({super.key});

  @override
  State<PaginationBar> createState() => _PaginationBarState();
}

class _PaginationBarState extends State<PaginationBar> {
  final NumberPaginatorController controller = NumberPaginatorController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NumberPaginator(
        controller: controller,
        // by default, the paginator shows numbers as center content
        numberPages: 10,
        onPageChange: (int index) {
          setState(() {
            _currentPage = index; // _currentPage is a variable within State of StatefulWidget
          });
        },
        // initially selected index
        initialPage: 4,
        config: NumberPaginatorUIConfig(
          // default height is 48
          height: 64,
          buttonShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: context.theme.colorScheme.outlineVariant,
              width: 0.5,
            ),
          ),
          buttonTextStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StyleScheme.engFontFamily,
          ),
          contentPadding: EdgeInsets.all(8.sp),
          buttonSelectedForegroundColor: context.theme.colorScheme.onPrimary,
          buttonUnselectedForegroundColor: context.theme.colorScheme.onSurface,
          buttonUnselectedBackgroundColor: context.theme.colorScheme.surface,
          buttonSelectedBackgroundColor: context.theme.colorScheme.primary,
        ),
      ),
    );
  }
}