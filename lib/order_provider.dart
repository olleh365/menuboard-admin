import 'package:flutter/material.dart';
import 'exam_menu_model.dart';

class OrderProvider extends ChangeNotifier {
  final List<Order> _orders = [
    Order(
      orderNumber: '00001111',
      orderTime: DateTime.now(),
      tableNumber: 5,
      items: [
        OrderItem(
          mainMenu: '반건조오징어',
          mainMenuPrice: 12000,
          additionalMenu: [
            AdditionalMenuItem(name: '땅콩', price: 1000),
            AdditionalMenuItem(name: '마요네즈', price: 2000),
          ],
          quantity: 1,
        ),
        OrderItem(
          mainMenu: '감자튀김',
          mainMenuPrice: 14000,
          additionalMenu: [
            AdditionalMenuItem(name: '케찹', price: 2000),
            AdditionalMenuItem(name: '머스타드', price: 3000),
          ],
          quantity: 2,
        ),
        OrderItem(
          mainMenu: '탕후루',
          mainMenuPrice: 2000,
          additionalMenu: [
            AdditionalMenuItem(name: '귤', price: 1000),
            AdditionalMenuItem(name: '포도', price: 1000),
          ],
          quantity: 2,
        ),
        OrderItem(
          mainMenu: '탕후루',
          mainMenuPrice: 2000,
          additionalMenu: [
            AdditionalMenuItem(name: '귤', price: 1000),
            AdditionalMenuItem(name: '포도', price: 1000),
          ],
          quantity: 2,
        ),
        OrderItem(
          mainMenu: '탕후루',
          mainMenuPrice: 2000,
          additionalMenu: [
            AdditionalMenuItem(name: '귤', price: 1000),
            AdditionalMenuItem(name: '포도', price: 1000),
          ],
          quantity: 2,
        ),
        OrderItem(
          mainMenu: '탕후루',
          mainMenuPrice: 2000,
          additionalMenu: [
            AdditionalMenuItem(name: '귤', price: 1000),
            AdditionalMenuItem(name: '포도', price: 1000),
          ],
          quantity: 2,
        ),

      ],
    ),
    Order(
      orderNumber: '00002222',
      orderTime: DateTime.now(),
      tableNumber: 3,
      items: [
        OrderItem(
          mainMenu: '돈까스',
          mainMenuPrice: 12000,
          additionalMenu: [
            AdditionalMenuItem(name: '샐러드', price: 4000),
          ],
          quantity: 1,
        ),
      ],
    ),

  ];

  List<Order> get orders => _orders;
}