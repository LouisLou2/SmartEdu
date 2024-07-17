import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/domain/entity/campus.dart';
import 'package:smart_edu/domain/entity/major.dart';
import 'package:smart_edu/domain/entity/school.dart';
import 'package:smart_edu/domain/general/tuple2.dart';
import 'package:smart_edu/extension/context_extension.dart';

import '../../domain/general/option_section.dart';
import '../../style/style_scheme.dart';

OptionSection getCampusList(List<Campus> campuses) {
  OptionSection optionSection = OptionSection(title: '校区', options: ['不限']);
  optionSection.options.addAll(OptionSection.fromCampus(campuses).options);
  return optionSection;
}

OptionSection getBuildingList(List<String> buildings) {
  OptionSection optionSection = OptionSection(title: '楼栋', options: ['不限']);
  optionSection.options.addAll(OptionSection.fromBuilding(buildings).options);
  return optionSection;
}

OptionSection getSchoolList(List<School> schools) {
  OptionSection optionSection = OptionSection(title: 'School', options: ['不限']);
  optionSection.options.addAll(OptionSection.fromSchoolList(schools).options);
  return optionSection;
}

OptionSection getMajorList(List<Major> majors) {
  OptionSection optionSection = OptionSection(title: 'Major', options: ['不限']);
  optionSection.options.addAll(OptionSection.fromMajorList(majors).options);
  return optionSection;
}

List<Widget> getTextList(
  List<OptionSection> list,
  BuildContext context,
) {
  List<Widget> widgets = [];
  var theme = context.theme;
  for (int i = 0; i < list.length; ++i) {
    var sec = list[i];
    widgets.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(32, 6, 6, 6),
        child: Text(
          sec.title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            fontFamily: StyleScheme.engFontFamily,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
    for (int j = 0; j < sec.options.length; ++j) {
      widgets.add(
        ShadOption<Tuple2<int, int>>(
          value: Tuple2<int, int>(i, j),
          child: Text(
            sec.options[j],
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: StyleScheme.engFontFamily,
            ),
          ),
        ),
      );
    }
  }
  return widgets;
}
