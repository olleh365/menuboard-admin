import 'package:flutter/material.dart';
import 'package:menuboard_admin/exam_menu_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'order_provider.dart';
import 'serving_screen.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  void cancelWindow(BuildContext context, OrderItem item){
    var f = NumberFormat('###,###,###,###');
    final additionalMenu = item.additionalMenu
        .map((addItem) => addItem.name)
        .join(', ');
    final cencelMenu = '[${item.mainMenu}/$additionalMenu ${item.quantity}개 ${f.format(item.totalPrice)}원]\n'
    '해당 주문을 취소하시겠습니까?';
    // 취소 시 팝업창 빌드
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: const Text('주문 취소', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),textAlign: TextAlign.center),
            content: Text(cencelMenu, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF777777)) ,textAlign: TextAlign.center),
            // 하단 '취소', '확인' 버튼
            actions: <Widget>[
              TextButton(onPressed:() {Navigator.of(context).pop();},
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFFF5F5F5),
            minimumSize: const Size(136, 48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
          )
          ,child: const Text('취소', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black))),
              TextButton(onPressed:() {Navigator.of(context).pop();},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFFF662B),
                    minimumSize: const Size(136, 48),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                  ),
          child: const Text('확인', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),))
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context).orders;
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
                              onPressed: () {
                                Provider.of<OrderProvider>(context, listen: false).approveOrder(order);
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF662B),
                                  foregroundColor: Colors.white,
                                padding: EdgeInsets.zero,
                              ),
                                child: const Text(
                                  '주문승인',
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
                  // order 모델 객체 리스트를 위젯 리스트로 변환
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

                          // 취소 버튼 UI
                          SizedBox(
                            width: 37,
                            height: 24,
                            child: TextButton(
                                onPressed:() {
                                  cancelWindow(context, item);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFFF5F5F5),
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.zero
                                ),
                                child: const Text('취소',
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12
                                  ),
                                )
                            ),
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
  }
}
