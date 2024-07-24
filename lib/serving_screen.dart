import 'package:flutter/material.dart';
import 'package:menuboard_admin/exam_menu_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'order_provider.dart';

class ServingScreen extends StatefulWidget {
  const ServingScreen({super.key});

  @override
  ServingScreenState createState() => ServingScreenState();
}

class ServingScreenState extends State<ServingScreen>{
  final Map<int, bool> _checkedItems = {};

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context).orders;
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        final isChecked = _checkedItems[index]??false;
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
                          //
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
                        SizedBox(
                            width: 61,
                            height: 24,
                            child: TextButton(
                                onPressed: toastExample,
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF662B),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text(
                                  '전체 완료',
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w600
                                  ),
                                )
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
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
                                const SizedBox(height: 8,)
                              ],
                            ),
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _checkedItems[index] = value ?? false;
                                });
                              },
                              activeColor: const Color(0xFFFF662B),
                              side: const BorderSide(
                                color: Color(0xFFDFDFDF),
                                width: 2,
                              ),
                            ),
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
  }
}
