import 'hour_min.dart';

class CourseSpan{
  HourMin begin;
  HourMin end;

  CourseSpan(this.begin, this.end);

  @override
  String toString() {
    return '$begin-$end';
  }
}