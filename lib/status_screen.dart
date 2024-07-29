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
    final orders = Provider.of<OrderProvider>(context).approvedOrders;
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
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.9 / 1.5,
      ),

      itemCount: tableOrders.length,
      itemBuilder: (context, index) {
        final tableNumber = index + 1;
        final order = tableOrders[tableNumber];
        final totalPrice = order?.items.fold(0.0, (sum, item) => sum + item.totalPrice);
        final otherQuantity = order!.items.length >= 4 ? order.items.length -3 : 0;
        return GestureDetector(
          onTap: () => tableDialog(context, tableNumber, order),
          child: Column(
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
                    const SizedBox(height: 8),
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
          ),
        );
      },
    );
  }
// 테이블 팝업 화면
  void tableDialog(BuildContext context, int tableNumber, Order order) {
    showDialog(
        context: context,
        builder: (context) {
          final formattedTime = DateFormat('HH:mm').format(order.orderTime);
          return AlertDialog(
            backgroundColor: const Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.zero,
              // 기본 구성 요소들이 shape 속성을 덮어씌우기 때문에 ClipRRect 위젯 사용
              content: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child : SizedBox(
                height: 800,
                width: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '테이블 $tableNumber',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,
                              color: order.items.isEmpty ? const Color(0xFF777777): const Color(0xFFFF662B),),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xFFF5F5F5),
                      height: 1,
                      thickness: 1,
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '현재 주문중',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFFFF662B)),
                          ),
                          Row(
                              children:[
                                Text(
                                  '주문번호 ${order.orderNumber}',
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                                Text(' ($formattedTime)',
                                  style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Color(0xFF777777),),
                                ),
                              ],
                          ),
                        const SizedBox(height: 4,),
                        ...order.items.map((item) =>
                            Column(
                              children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                width: 400,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                    Text(
                                      '${item.mainMenu}, ${item.quantity}개',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${item.additionalMenu.map((
                                              addItem) => addItem.name).join(' / ')} 추가',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF777777),
                                          ),
                                        ),
                                        Text(
                                          '${f.format(item.totalPrice)}원',
                                          style: const TextStyle(color: Color(0xFF777777),fontSize: 14, fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                              ]
                            ),

                            ),
                                const SizedBox(height: 8,)
                          ],
                          ),
                        ),
                          const SizedBox(height: 8),
                          CustomPaint(
                            painter: DotDivider(),
                            size: const Size(double.infinity,3),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('총 금액',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                                Text('${f.format(order.totalPrice)}원',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),)
                              ],
                            ),
                          )

                        ],
                      ),
                    )
                  ],
                ),
              )
              ),
          );
        }
    );
  }
}

// 점선 구분선 생성
class DotDivider extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFF777777)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 5;
    var dashSpace = 5;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}