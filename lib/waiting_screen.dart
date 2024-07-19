import 'package:flutter/material.dart';
import 'exam_menu_model.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'main.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 임시 주문 데이터
    final List<Order> orders = [
      Order(
        orderNumber: '001',
        orderTime: DateTime.now(),
        tableNumber: 5,
        items: [
          OrderItem(
            mainMenu: '메인 메뉴 1',
            mainMenuPrice: 10.0,
            additionalMenu: [
              AdditionalMenuItem(name: '추가 메뉴 1', price: 2.0),
              AdditionalMenuItem(name: '추가 메뉴 2', price: 3.0),
            ],
            quantity: 2,
          ),
        ],
      ),
      Order(
        orderNumber: '002',
        orderTime: DateTime.now(),
        tableNumber: 3,
        items: [
          OrderItem(
            mainMenu: '메인 메뉴 2',
            mainMenuPrice: 12.0,
            additionalMenu: [
              AdditionalMenuItem(name: '추가 메뉴 3', price: 1.5),
            ],
            quantity: 1,
          ),
        ],
      ),
    ];

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        final formattedTime = DateFormat('HH:mm').format(order.orderTime);
        return Column(
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
                              order.orderNumber,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF777777)
                              ),
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
                              ' | 테이블 ${order.tableNumber}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF777777),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            child: TextButton(
                              onPressed: toastExample,
                              child: Text('주문승인')
                            )
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFF5F5F5),
                  ),
                  ...order.items.map((item) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            '${item.mainMenu}, ${item.quantity}개',
                            style: const TextStyle(
                                fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black
                            ),
                          ),
                          Text(
                            '${item.additionalMenu.map((
                                addItem) => addItem.name).join(', ')} 추가',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF777777),
                            ),
                          ),
                        ],
                    ),
                      )),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 2)
          ],
        );
      },
    );
  }
}
