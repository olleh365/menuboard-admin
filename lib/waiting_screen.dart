import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'waiting_screen_controller.dart';
import 'package:intl/intl.dart';

class WaitingScreen extends GetView<WaitingScreenController> {

  @override
  Widget build(BuildContext context) {
    Get.put(WaitingScreenController());
    return Obx(() {
      return ListView.builder(
        itemCount: controller.orders.length,
        itemBuilder: (context, index) {
          final order = controller.orders[index];
          final formattedTime = DateFormat('HH:mm').format(order.orderDate);
          return Column(
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                order.orderNum,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF777777)),
                              ),
                              Text(
                                ' ($formattedTime)',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF777777),
                                ),
                              ),
                              Text(
                                ' | 테이블 ${order.tableNum}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF777777),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: 61,
                              height: 24,
                              child: TextButton(
                                  onPressed: () {
                                    controller.updateOrderItem(order.orderSeq);
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFFFF662B),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: const Text(
                                    '주문승인',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )))
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xFFF5F5F5),
                    ),
                    ...order.menuList.map((item) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Text(
                                  '${item.menuName}, ${item.quantity}개',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  item.selectedOptions
                                      .map((addItem) => addItem.menuOptionName)
                                      .join(' / 추가 '),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF777777),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 37,
                            height: 24,
                            child: TextButton(
                                onPressed: () {
                                  controller.cancelWindow(
                                      context, order.orderSeq, item);
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFFF5F5F5),
                                    foregroundColor: Colors.black,
                                    padding: EdgeInsets.zero),
                                child: const Text(
                                  '취소',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                )),
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 2)
            ],
          );
        },
      );
    });
  }
}
