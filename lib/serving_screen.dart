import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'order_model.dart';
import 'menu_network.dart';
import 'package:dio/dio.dart';
import 'refresh_provider.dart';
import 'store_provider.dart';





class ServingScreen extends StatefulWidget {
  const ServingScreen({super.key});

  @override
  ServingScreenState createState() => ServingScreenState();
}

class ServingScreenState extends State<ServingScreen> {
  late MenuNetwork _menuNetwork;
  List<Order> _acceptedOrders = [];
  final Map<int, Map<int, bool>> _checkedItems = {};

  @override
  void initState() {
    super.initState();
    final storeState = Provider.of<StoreState>(context, listen: false);
    final dio = Dio();
    dio.options.headers['Authorization'] = storeState.token;
    _menuNetwork = MenuNetwork(dio);
    _fetchOrders();
  }


  Future<void> _fetchOrders() async {
    final storeState = Provider.of<StoreState>(context, listen: false);
    try {
      OrderResponse response = await _menuNetwork.getOrders(storeState.storeSeq, storeState.date);
      setState(() {
        _acceptedOrders = response.data.where((order) => order.orderStatus == 'ACCEPTED' || order.orderStatus == 'COOKED' || order.orderStatus == 'SERVED').toList();
      });
    } catch (e) {
      debugPrint('Error fetching orders: $e');
    }
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final refreshNotifier = Provider.of<RefreshNotifier>(context, listen: false);
    refreshNotifier.addListener(() {
      Future.microtask(() => _fetchOrders());
    });
  }

  @override
  Widget build(BuildContext context) {

    // 승인된 주문 테이블 영역
    return ListView.builder(
      itemCount: _acceptedOrders.length,
      itemBuilder: (context, index) {
        final order = _acceptedOrders[index];
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
                        // 전체 완료 버튼
                        SizedBox(
                            width: 61,
                            height: 24,
                            child: TextButton(
                                onPressed: () {
                                  // 현재 인덱스에 해당하는 주문의 모든 항목의 체크 상태 업데이트, 엔트리 리스트로 부터 새로운 맵 생성함
                                  setState(() {
                                    final allChecked = _checkedItems[index]
                                            ?.values
                                            .every((checked) => checked) ??
                                        false;
                                    _checkedItems[index] = Map.fromEntries(
                                      order.menuList.map((item) => MapEntry(
                                          order.menuList.indexOf(item),
                                          !allChecked)),
                                    );
                                  });
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF662B),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text(
                                  '전체 완료',
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
                  // 승인된 주문 목록리스트 UI
                  ...order.menuList.map((item) {
                    final itemIndex = order.menuList.indexOf(item);
                    final isChecked = _checkedItems[index]?[itemIndex] ?? false;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8),
                                  Text(
                                    '${item.menuName}, ${item.quantity}개',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      decoration: isChecked ? TextDecoration.lineThrough : null,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    item.selectedOptions.map((addItem) => addItem.menuOptionName).join(' 추가 / '),
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF777777),
                                      decoration: isChecked ? TextDecoration.lineThrough : null,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                          ),
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _checkedItems[index] ??= {};
                                _checkedItems[index]![itemIndex] =
                                    value ?? false;
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
                    );
                  }),
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
