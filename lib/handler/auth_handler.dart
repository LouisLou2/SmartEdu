import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/web_data.dart';
import '../datasource/manage/net_path_collector.dart';

class AuthHandler{
  static late final SharedPreferences _preferences;

  static Future<void> init() async{
    _preferences = await SharedPreferences.getInstance();
  }

  static checkToken() {
    String? token = _preferences.getString('token');
    if(token==null){
      goToLogin();
      return;
    }
  }

  static void setToken(String token){
    _preferences.setString('token', token);
  }

  static String getToken(){
    //调用此方法前一定要checkToken,而不是直接调用
    return _preferences.getString('token')!;
  }

  static void goToLogin(){
    launchUrl(
      Uri.http(
        NetworkPathCollector.getLoginPath(),'',{
          'redirect': WebData.thisUrl,
        },
      ),
      webOnlyWindowName: '_self',
    );
  }
}