import 'package:flutter/material.dart';

class StaticsPageProv extends ChangeNotifier {
  int _page = 0;

  int _repairPage = 0;
  get repairPage => _repairPage;
  get page => _page;
  void setPage(int page) {
    _page = page;
    notifyListeners();
  }

  void setRepairPage(int page) {
    _repairPage = page;
    notifyListeners();
  }
}
