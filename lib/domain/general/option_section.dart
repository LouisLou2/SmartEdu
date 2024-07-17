import 'package:smart_edu/domain/entity/campus.dart';
import 'package:smart_edu/domain/entity/major.dart';
import 'package:smart_edu/domain/entity/school.dart';
import 'package:smart_edu/domain/entity/term.dart';

class OptionSection {
  String title;
  List<String> options;

  OptionSection({required this.title, required this.options});

  OptionSection.fromTerm(List<Term> terms)
      : title = 'Terms',
        options = terms.map((e) => e.toString()).toList();

  OptionSection.fromCampus(List<Campus> campuses)
      : title = '校区',
        options = campuses.map((e) => e.toString()).toList();

  OptionSection.fromBuilding(List<String> buildings)
      : title = '楼栋',
        options = buildings;
  OptionSection.fromTypes(Map<int, String> types)
      : title = 'Types',
        options = types.values.toList();

  OptionSection.fromSchoolList(List<School> items)
      : title = 'Schools',
        options = items.map((e) => e.schoolName).toList();

  OptionSection.fromMajorList(List<Major> items)
      : title = 'Majors',
        options = items.map((e) => e.majorName).toList();
}
