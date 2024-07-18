import '../../const/config.dart';

class NetworkPathCollector {
  static const String host = Configs.BaseUrl;// server host
  static const String restfulAPI = ""; // restful api
  static const String userApi = "$host$restfulAPI";// dio的baseUrl，客户端一切请求都是基于这个baseUrl的
  /*------------------分类-------------------*/
  static const basicInfo = "/tr/files/basicInfo";
  static const studentInfo = "/uau/admin/studentDetailInfo";
  static const curriculumPlan = "/uau/admin/educationPlanByMajor";
  static const stuCourseSchedule = "/uau/admin/courseTable";
  static const examTasks = "/uau/examStu/examStuInfo";
  static const scores = "/ac/api/studentGrades";
  static const termAttendance = "/uau/stuCourseSched/attendanceStu";
  static const courseSelection = '/ac/api/courseSelection';
  /*------------------分类-------------------*/
  static String getLoginPath() => "www.google.com";
}