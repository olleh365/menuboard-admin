import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu_network.dart';
import 'package:dio/dio.dart';
import 'order_model.dart';
import 'store_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'refresh_provider.dart';


class KitchenScreen extends StatefulWidget {
  const KitchenScreen({super.key});

  @override
  KitchenScreenState createState() => KitchenScreenState();
}

class KitchenScreenState extends State<KitchenScreen> {
  late MenuNetwork _menuNetwork;
  List<Order> _acceptedOrders = [];
  final Map<int, bool> _checkedItems = {};

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

  // void _updateOrderItem(int orderSeq) async {
  //   try{
  //     await _menuNetwork.updateMenu(orderSeq);
  //     _fetchOrders();
  //   } catch (e) {
  //     debugPrint('Error updating Function: $e');
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    // 각 오더의 주문 목록 호출 (orderItems 리스트 변수에 Order.items 리스트를 결합하여 저장함)

    final orderItems = _acceptedOrders.expand((order) => order.menuList).toList();

    // 승인된 주문메뉴 리스트
    return ListView.builder(
      itemCount: orderItems.length,
      itemBuilder: (context, index) {
        final orderItem = orderItems[index];
        final order = _acceptedOrders.firstWhere((order) => order.menuList.contains(orderItem));
        final isChecked = _checkedItems[index] ?? false;
        return Column(
          children: [
            if (index == 0) const SizedBox(height: 8),
            Container(
              color: isChecked ? const Color(0xFFFAFAFA) : Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Text('테이블 ${order.tableNum}',
                              style:  TextStyle(
                                fontWeight: FontWeight.w500, color: const Color(0xFF777777),
                                decoration: isChecked ? TextDecoration.lineThrough : null,
                                  decorationColor: const Color(0xFF777777)
                              ),
                            ),
                            Text(
                              '${orderItem.menuName}, ${orderItem.quantity}개',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: isChecked ? const Color(0xFF777777) : Colors.black,
                                decoration: isChecked ? TextDecoration.lineThrough : null,
                                decorationColor: const Color(0xFF777777),
                              ),
                            ),
                            Text(
                              orderItem.selectedOptions.map((addItem) => addItem.menuOptionName).join(' 추가 / '),
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
                  const Divider(
                      height: 1, thickness: 1, color: Color(0xFFDFDFDF))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
