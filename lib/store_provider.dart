import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StoreState extends ChangeNotifier {
  int _storeSeq = 16;
  String _date = '20240812';
  final _token = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuS2tHR01Wb2hpZm9jUmNTRzYwTzdycWlhZTEzIiwiYXV0aFJvbGVzIjoiU1RPUkVfQURNSU4iLCJpYXQiOjE3MjM0NTU4OTIsImV4cCI6MTcyMzQ1OTQ5Mn0.pAUSLHbrYVHyJF_Szn0CeNH1xiN_0rYxA8PxIFwEPzE';
// dotenv.env['API_AUTH_TOKEN'];

  int get storeSeq => _storeSeq;
  String get date => _date;
  String get token => _token;

  void updateStoreSeq(int newStoreSeq) {
    _storeSeq = newStoreSeq;
    notifyListeners();
  }

  void updateDate(String newDate) {
    _date = newDate;
    notifyListeners();
  }
}

