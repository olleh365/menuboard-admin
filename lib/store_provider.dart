import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StoreState extends ChangeNotifier {
  int _storeSeq = 16;
  String _date = '20240812';
  final _token = 'Bearer ${dotenv.env['API_AUTH_TOKEN']}';
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

