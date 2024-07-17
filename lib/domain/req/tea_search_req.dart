class TeaSearchReq {
  int? schoolId;
  int? majorId;
  int? title;
  String? name;
  bool? gender;
  int offset;
  int num;

  TeaSearchReq({
    this.schoolId,
    this.majorId,
    this.title,
    this.name,
    this.gender,
    required this.offset,
    required this.num,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (schoolId != null) data['schoolId'] = schoolId;
    if (majorId != null) data['majorId'] = majorId;
    if (title != null) data['title'] = title;
    if (name != null) data['name'] = name;
    if (gender != null) data['gender'] = gender;
    data['offset'] = offset;
    data['num'] = num;

    return data;
  }
}