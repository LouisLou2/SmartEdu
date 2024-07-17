import 'package:flutter/cupertino.dart';

class GlobalKeyData{
  static GlobalKey appKey = GlobalKey();
  static BuildContext get currentContext => appKey.currentContext!;
}