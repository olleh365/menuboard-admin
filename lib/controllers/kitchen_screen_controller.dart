import 'dart:async';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../services/menu_network.dart';
import '../models/order_model.dart';
import 'store_controller.dart';

class KitchenScreenController extends GetxController {
  var orders = <Order>[].obs;
  var orderItems = <Menu>[].obs;
  var checkedItems = <int, bool>{}.obs;
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
    startPolling();
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
      OrderResponse response = await _menuNetwork.getOrders(
          storeState.storeSeq.value, storeState.date.value);
      orders.value =
          response.data.where((order) => order.orderStatus == 'WAIT').toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load orders: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void updateOrderItem(int orderSeq) async {
    try {
      await _menuNetwork.updateMenu(orderSeq);
      fetchOrders();
    } catch (e) {
      Get.snackbar('Error', 'Failed to update order: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void menuCheckbox(int index, bool value) {
    checkedItems[index] = value;
    checkedItems.refresh();
  }


  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}