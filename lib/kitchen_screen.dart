import 'package:flutter/material.dart';
import 'package:menuboard_admin/exam_menu_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'order_provider.dart';

class KitchenScreen extends StatelessWidget {
  const KitchenScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context).orders;
    final orderItems = orders.expand((order) => order.items).toList();

    return ListView.builder(
      itemCount: orderItems.length,
      itemBuilder: (context, index) {
        final orderItem = orderItems[index];
        return Column(
          children: [
            if (index == 0) const SizedBox(height: 8),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                Text(
                                  '${orderItem.mainMenu}, ${orderItem.quantity}개',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black
                                  ),
                                ),
                                Text(
                                  '${orderItem.additionalMenu.map((
                                      addItem) => addItem.name).join(', ')} 추가',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF777777),
                                  ),
                                ),
                                const SizedBox(height: 16)
                              ],
                            ),
                          ],
                        ),
                      ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFDFDFDF))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
