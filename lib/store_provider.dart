import 'package:flutter/material.dart';

class StoreState extends ChangeNotifier {
  int _storeSeq = 16;
  String _date = '20240807';

  int get storeSeq => _storeSeq;
  String get date => _date;

  void updateStoreSeq(int newStoreSeq) {
    _storeSeq = newStoreSeq;
    notifyListeners();
  }

  void updateDate(String newDate) {
    _date = newDate;
    notifyListeners();
  }
}

