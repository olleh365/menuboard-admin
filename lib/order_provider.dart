import 'package:flutter/material.dart';
import 'exam_menu_model.dart';

class OrderProvider extends ChangeNotifier {
  final List<Order> _orders = [
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
        OrderItem(
          mainMenu: '메인 메뉴 3',
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

  List<Order> get orders => _orders;
}