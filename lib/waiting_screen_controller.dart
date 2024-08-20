import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'menu_network.dart';
import 'order_model.dart';
import 'store_controller.dart';

class WaitingScreenController extends GetxController {
  var orders = <Order>[].obs;
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
      fetchOrders(); // 삭제 후 주문 목록 갱신
    } catch (e) {
      Get.snackbar('Error', 'Failed to cancel order: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // 취소 확인 창
  void cancelWindow(BuildContext context, int orderItem, Menu item) {
    var f = NumberFormat('###,###,###,###');
    final additionalMenu =
    item.selectedOptions.map((addItem) => addItem.menuOptionName).join('/');
    final cancelMenu =
        '[${item.menuName}/$additionalMenu ${item.quantity}개 ${f.format(item.menuTotalPrice)}원]\n'
        '해당 주문을 취소하시겠습니까?';

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '주문 취소',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                cancelMenu,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF777777)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F5F5),
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        '취소',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        cancelOrderItem(orderItem, item.orderMenuSeq);
                        Get.back();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFFF662B),
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        '확인',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }


}
