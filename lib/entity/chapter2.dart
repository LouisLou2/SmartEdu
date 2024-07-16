import 'package:smart_edu/entity/teaching_material.dart';

class Chapter2 {
  int id;
  String title;
  List<TeachingMaterial> content;

  Chapter2({required this.id, required this.title, required this.content});

  factory Chapter2.fromJson(Map<String, dynamic> json){
    return Chapter2(
      id: json['id'],
      title: json['title'],
      content: (json['content'] as List).map((e) => TeachingMaterial.fromJson(e)).toList()
    );
  }
}