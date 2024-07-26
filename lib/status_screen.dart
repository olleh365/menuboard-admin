import 'package:flutter/material.dart';
import 'package:menuboard_admin/exam_menu_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'order_provider.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  StatusScreenState createState() => StatusScreenState();
}

class StatusScreenState extends State<StatusScreen>{
var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context).orders;
    // 테이블 번호와 Order 매핑
    final tableOrders = {
      for (var i = 1; i <= 8; i++)
        i: orders.firstWhere((order) => order.tableNumber == i,
            orElse: () => Order(orderNumber: '', orderTime: DateTime.now(), tableNumber: i, items: []))};

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1.8 / 1.5,
      ),

      itemCount: tableOrders.length,
      itemBuilder: (context, index) {
        final tableNumber = index + 1;
        final order = tableOrders[tableNumber];
        final totalPrice = order?.items.fold(0.0, (sum, item) => sum + item.totalPrice);
        final otherQuantity = order!.items.length >= 4 ? order.items.length -3 : 0;
        return Column(
          children: [
            Container(
              height: 152,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '테이블 $tableNumber',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: order.items.isEmpty ? const Color(0xFF777777): const Color(0xFFFF662B),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: 71,
                            height: 24,
                            child: TextButton(
                                onPressed: toastExample,
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF662B),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text(
                                  '테이블 리셋',
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w600
                                  ),
                                )
                            )
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                    ...order.items.take(3).map((item) =>
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.mainMenu,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                            // 개수
                            Text(
                                '${item.quantity}개',
                              style: const TextStyle(color: Color(0xFFAAAAAA),fontWeight: FontWeight.w500,fontSize: 12),
                            ),
                          ],
                        ),
                      )),
                  const Spacer(),
                  const Divider(
                    color: Color(0xFFF5F5F5),
                    height: 1,
                    thickness: 1,
                  ),
                  Container(
                    height: 38,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('외 $otherQuantity항목',style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Color(0xFF777777)),),
                          Text(
                            '${f.format(totalPrice)}원',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                      ]
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}