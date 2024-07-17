import 'package:flutter/material.dart';

class PageProv with ChangeNotifier {
  List<int> page = [0,0,0];

  void setPage(int role ,int page) {
    assert(role >= 0 && role < 3);
    this.page[role] = page;
    notifyListeners();
  }
}