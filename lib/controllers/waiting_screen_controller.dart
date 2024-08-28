import 'dart:async';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../services/menu_network.dart';
import '../models/order_model.dart';
import 'store_controller.dart';

class WaitingScreenController extends GetxController {
  RxList orders = <Order>[].obs;
  RxList orderItems = <Menu>[].obs;
  late MenuNetwork _menuNetwork;
  final StoreController storeState = Get.put(StoreController());
  Timer? _timer;

  List<Menu> getMenuItem(int orderIndex) {
    return orders[orderIndex].menuList;
  }

  @override
  void onInit() {
    super.onInit();
    final dio = Dio();
    dio.options.headers['Authorization'] = storeState.token;
    _menuNetwork = MenuNetwork(dio);
    fetchOrders();
    startPolling();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  // 주기적인 폴링으로 실시간 호출
  void startPolling() {
    _timer?.cancel();
    Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchOrders();
    });
  }

  Future<void> fetchOrders() async {
    try {
      OrderResponse response = await _menuNetwork.getOrders(storeState.storeSeq.value, storeState.date.value);
      orders.value = response.data.where((order) => order.orderStatus == 'WAIT').toList();
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

  // 주문 항목 취소
  void cancelOrderItem(int orderSeq, int orderMenuSeq) async {
    try {
      await _menuNetwork.deleteMenu(orderSeq, orderMenuSeq);
      fetchOrders();
    } catch (e) {
      Get.snackbar('Error', 'Failed to cancel order: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void refreshOrders() {
    fetchOrders();
  }
}
