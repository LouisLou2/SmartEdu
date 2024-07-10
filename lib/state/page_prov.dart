import 'package:flutter/material.dart';

class PageProv with ChangeNotifier {
  int page = 4;

  void setPage(int page) {
    this.page = page;
    notifyListeners();
  }
}