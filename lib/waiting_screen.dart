import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'menu_network.dart';
import 'store_provider.dart';
import 'package:dio/dio.dart';
import 'order_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'refresh_provider.dart';


class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  WaitingScreenState createState() => WaitingScreenState();
}

// AutomaticKeepAliveClientMixin 통한 불필요한 랜더링 제거
class WaitingScreenState extends State<WaitingScreen> with AutomaticKeepAliveClientMixin {
  late MenuNetwork _menuNetwork;
  List<Order> _orders = [];

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    dio.options.headers['Authorization'] = dotenv.env['API_AUTH_TOKEN'];
    _menuNetwork = MenuNetwork(dio);
    _fetchOrders();
  }

  Future<void> _fetchOrders() async {
    final storeState = Provider.of<StoreState>(context, listen: false);
    try {
      OrderResponse response = await _menuNetwork.getOrders(storeState.storeSeq, storeState.date);
      setState(() {
        _orders = response.data.where((order) => order.orderStatus == 'WAIT').toList();
      });
    } catch (e) {
      debugPrint('Error fetching orders: $e');
    }
  }

  @override
  // 데이터 의존하는 위젯
  void didChangeDependencies() {
    super.didChangeDependencies();
    final refreshNotifier = Provider.of<RefreshNotifier>(context, listen: false);
    refreshNotifier.addListener(() {
      // microtask를 사용하여 setState 호출을 미루기 (큐)
      Future.microtask(() => _fetchOrders());
    });
  }

  void _updateOrderItem(int orderSeq) async {
    try{
      await _menuNetwork.updateMenu(orderSeq);
      _fetchOrders();
    } catch (e) {
      debugPrint('Error updating Function: $e');
    }
  }

  void _cancelOrderItem(int orderSeq, int orderMenuSeq) async {
    try {
      await _menuNetwork.deleteMenu(orderSeq, orderMenuSeq);
      // 업데이트
      _fetchOrders();
    } catch (e) {
      debugPrint('Error deleting Function: $e');
    }
  }

  void cancelWindow(BuildContext context, int orderItem ,Menu item) {
    var f = NumberFormat('###,###,###,###');
    final additionalMenu =
        item.selectedOptions.map((addItem) => addItem.menuOptionName).join('/');
    final cencelMenu =
        '[${item.menuName}/$additionalMenu ${item.quantity}개 ${f.format(item.menuTotalPrice)}원]\n'
        '해당 주문을 취소하시겠습니까?';
    // 취소 시 팝업창 빌드
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: const Text('주문 취소',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center),
            content: Text(cencelMenu,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF777777)),
                textAlign: TextAlign.center),
            // 하단 '취소', '확인' 버튼
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      minimumSize: const Size(136, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text('취소',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black))),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _cancelOrderItem(orderItem ,item.orderMenuSeq);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFF662B),
                      minimumSize: const Size(136, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text(
                    '확인',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: _orders.length,
      itemBuilder: (context, index) {
        final order = _orders[index];
        final formattedTime = DateFormat('HH:mm').format(order.orderDate);
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
                              order.orderNum,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF777777)),
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
                              ' | 테이블 ${order.tableNum}',
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
                                  _updateOrderItem(order.orderSeq);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF662B),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text(
                                  '주문승인',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )))
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFF5F5F5),
                  ),
                  // order 모델 객체 리스트를 위젯 리스트로 변환
                  ...order.menuList.map((item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Text(
                                  '${item.menuName}, ${item.quantity}개',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                Text(
                                  item.selectedOptions.map((addItem) => addItem.menuOptionName).join(' / 추가 '),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF777777),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                )
                              ],
                            ),

                            // 취소 버튼 UI
                            SizedBox(
                              width: 37,
                              height: 24,
                              child: TextButton(
                                  onPressed: () {
                                    cancelWindow(context,order.orderSeq ,item);
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFFF5F5F5),
                                      foregroundColor: Colors.black,
                                      padding: EdgeInsets.zero),
                                  child: const Text(
                                    '취소',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  )),
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
  @override
  bool get wantKeepAlive => true;
}
