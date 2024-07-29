import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'order_provider.dart';

class KitchenScreen extends StatefulWidget {
  const KitchenScreen({super.key});

  @override
  KitchenScreenState createState() => KitchenScreenState();
}

class KitchenScreenState extends State<KitchenScreen> {
  final Map<int, bool> _checkedItems = {};

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context).approvedOrders;
    // 각 오더의 주문 목록 호출 (orderItems 리스트 변수에 Order.items 리스트를 결합하여 저장함)
    final orderItems = orders.expand((order) => order.items).toList();

    return ListView.builder(
      itemCount: orderItems.length,
      itemBuilder: (context, index) {
        final orderItem = orderItems[index];
        final isChecked = _checkedItems[index]??false;
        return Column(
          children: [
            if (index == 0) const SizedBox(height: 8),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _checkedItems[index] = value ?? false;
                                });
                              },
                              activeColor: const Color(0xFFAAAAAA),
                              side: const BorderSide(
                                color: Color(0xFFDFDFDF),
                                width: 2,
                              ),
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
