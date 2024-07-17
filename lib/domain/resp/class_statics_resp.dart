import 'package:smart_edu/domain/entity/class_statics_item.dart';

class ClassStaticsResp {
  ClassStaticsResp({
    this.classes,
    this.sum,
  });

  ClassStaticsResp.fromJson(dynamic json) {
    if (json['classes'] != null) {
      classes = [];
      json['classes'].forEach((v) {
        classes?.add(ClassStaticsItem.fromJson(v));
      });
    }
    sum = json['sum'];
  }
  List<ClassStaticsItem>? classes;
  num? sum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (classes != null) {
      map['classes'] = classes?.map((v) => v.toJson()).toList();
    }
    map['sum'] = sum;
    return map;
  }
}
