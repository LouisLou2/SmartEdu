import '../../const/config.dart';

class NetworkPathCollector {
  static const String host = Configs.BaseUrl; // server host
  static const String restfulAPI = ""; // restful api

  static const String userApi =
      "$host$restfulAPI"; // dio的baseUrl，客户端一切请求都是基于这个baseUrl的
  /*------------------分类-------------------*/
  static const classStatics = "/classes";
  static const classroomStatics = "/ac/api/classrooms";
  static const info = "/info";
  static const school_major = "/school_major";
  static const campus_building = "/campus_building";
  static const teachers = "/teachers";
  static const student = "/students";
  static const repairReport = "/ac/api/fault_report";
  static const applyList = "/ac/api/classroomReservations";
}
