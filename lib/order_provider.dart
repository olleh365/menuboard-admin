import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:menuboard_admin/menu_network.dart';
import 'order_model.dart';
import 'grouped_tables_model.dart' as grouped_tables;

class OrderProvider with ChangeNotifier {
  final MenuNetwork _menuNetwork;
  List<Order> waitingOrders = [];
  List<grouped_tables.OrderGroup> statusOrders = [];

  OrderProvider(this._menuNetwork);

  Future<void> fetchAllOrders(int storeSeq, String date) async {
    await Future.wait([
      fetchWaitingOrders(storeSeq, date),
      fetchStatusOrders(storeSeq, date),
    ]);
    notifyListeners();
  }

  Future<void> fetchWaitingOrders(int storeSeq, String date) async {
    try {
      final response = await _menuNetwork.getOrders(storeSeq, date);
      waitingOrders = response.data;
    } catch (e) {
      debugPrint('Error fetching waiting orders: $e');
    }
  }


  Future<void> fetchStatusOrders(int storeSeq, String date) async {
    try {
      final response = await _menuNetwork.getOrderGroups(storeSeq, date);
      statusOrders = response.data;
    } catch (e) {
      debugPrint('Error fetching status orders: $e');
    }
  }
}
