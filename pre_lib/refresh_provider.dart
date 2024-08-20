import 'package:flutter/material.dart';

class RefreshNotifier extends ChangeNotifier {
  void refresh() {
    notifyListeners();
  }
}