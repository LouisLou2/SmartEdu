class Campus {
  num campusId;
  String campus_name;
  List<String> building;

  Campus(
      {required this.campusId,
      required this.campus_name,
      required this.building});

  factory Campus.fromJson(Map<String, dynamic> json) {
    return Campus(
        campusId: json['campusId'],
        campus_name: json['campusName'],
        building: json['buildings'].cast<String>());
  }

  String toString() {
    return '🏫 $campusId. $campus_name';
  }
}
