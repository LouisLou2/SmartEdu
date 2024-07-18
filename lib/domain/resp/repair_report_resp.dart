import 'package:smart_edu/domain/entity/repair_report_model.dart';

class RepairReportResp {
  RepairReportResp({
    this.reports,
    this.sum,
  });

  RepairReportResp.fromJson(dynamic json) {
    if (json['records'] != null) {
      reports = [];
      json['records'].forEach((v) {
        reports?.add(Report.fromJson(v));
      });
    }
    sum = json['sum'];
  }
  List<Report>? reports;
  num? sum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (reports != null) {
      map['reports'] = reports?.map((v) => v.toJson()).toList();
    }
    map['sum'] = sum;
    return map;
  }
}
