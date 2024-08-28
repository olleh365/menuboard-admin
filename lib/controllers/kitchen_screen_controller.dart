import 'dart:async';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import '../services/menu_network.dart';
import '../models/order_model.dart';
import 'store_controller.dart';

class KitchenScreenController extends GetxController {
  RxList order = <Order>[].obs;
  RxList orderItems = <Menu>[].obs;
  RxMap checkedItems = <int ,bool>{}.obs;
  late MenuNetwork _menuNetwork;
  final StoreController storeState = Get.put(StoreController());



  @override
  void onInit() {
    super.onInit();
    final dio = Dio();
    dio.options.headers['Authorization'] = storeState.token;
    _menuNetwork = MenuNetwork(dio);
    fetchOrders();
    // 체크박스 시 즉시 갱신 완료
    ever(order, (_) {
      fetchOrders();
    });

  }

  Future<void> fetchOrders() async {
    try {
      OrderResponse response = await _menuNetwork.getOrders(
          storeState.storeSeq.value, storeState.date.value);
      order.value =
          response.data.where((order) => order.orderStatus == 'ACCEPTED' || order.orderStatus == 'COOKED' || order.orderStatus == 'SERVED').toList();

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
  }

}