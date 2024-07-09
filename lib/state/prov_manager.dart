import 'package:smart_edu/state/page_prov.dart';

class ProvManager {
  static late PageProv pageProv;

  static void init(){
    pageProv = PageProv();
  }
}