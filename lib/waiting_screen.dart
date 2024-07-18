import 'package:flutter/material.dart';
import 'exam_menu_model.dart';
import 'package:intl/intl.dart';

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
      // 더 많은 주문을 추가할 수 있습니다
    ];

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        final formattedTime = DateFormat('HH:mm').format(order.orderTime);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.orderNumber,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '($formattedTime)',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '| 테이블 ${order.tableNumber}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              ...order.items.map((item) =>
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        '${item.mainMenu}, ${item.quantity}개',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '추가 메뉴: ${item.additionalMenu.map((
                            addItem) => addItem.name).join(', ')}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 8),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}