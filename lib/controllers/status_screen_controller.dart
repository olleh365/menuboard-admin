import 'dart:async';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../services/menu_network.dart';
import 'package:menuboard_admin/models/grouped_tables_model.dart';
import 'store_controller.dart';

class StatusScreenController extends GetxController {
  var orderGroups = <OrderGroup>[].obs;
  late MenuNetwork _menuNetwork;
  final StoreController storeState = Get.put(StoreController());
  Timer? _timer;


  @override
  void onInit() {
    super.onInit();
    final dio = Dio();
    dio.options.headers['Authorization'] = storeState.token;
    _menuNetwork = MenuNetwork(dio);
    fetchOrders();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }


  Future<void> fetchOrders() async {
    try {
      TableResponse tableResponse = await _menuNetwork.getOrderGroups(storeState.storeSeq.value, storeState.date.value);
      orderGroups.value = tableResponse.data;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load orders: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void updateOrderItem(int orderSeq) async {
    try {
      await _menuNetwork.updateMenu(orderSeq);
      fetchOrders(); // 업데이트 후 주문 목록 갱신
    } catch (e) {
      Get.snackbar('Error', 'Failed to update order: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void refreshOrders() {
    fetchOrders();
  }
}
