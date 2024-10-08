import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:menuboard_admin/controllers/status_screen_controller.dart';

import '../models/grouped_tables_model.dart';

class StatusScreen extends StatelessWidget {
  StatusScreen({super.key});
  final StatusScreenController controller = Get.put(StatusScreenController());


  @override
  Widget build(BuildContext context) {
    // 테이블 영역 카드 UI
      return Padding(
        padding: const EdgeInsets.all(8.0),
          child:  StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: 8,

            itemBuilder: (BuildContext context, int index) {
              final tableNumber = index + 1;
              return Obx((){
                final orderGroup = controller.orderGroups.firstWhere(
                      (og) => og.tableNum == tableNumber,
                  orElse: () => OrderGroup(
                    orderGroupNum: -1,
                    tableNum: tableNumber,
                    totalOrderPrice: 0,
                    orders: [],
                  ),
                );
                final totalPrice = orderGroup.totalOrderPrice;
                final orders = orderGroup.orders;
                final otherQuantity = orders.length >= 4 ? orders.length - 3 : 0;
                var f = NumberFormat('###,###,###,###');
                return GestureDetector(
                  onTap: () => tableDialog(context, orderGroup),
                  child: SizedBox(
                    height: 152,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      elevation: 0,
                      color: Colors.white,
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
                                        color: orders.isEmpty
                                            ? const Color(0xFF777777)
                                            : const Color(0xFFFF662B),
                                      ),
                                    ),
                                  ],
                                ),
                                // 테이블 리셋 UI
                                SizedBox(
                                    width: 71,
                                    height: 24,
                                    child: TextButton(
                                        onPressed: () {
                                          controller.resetTable(tableNumber);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: const Color(0xFFFF662B),
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: const Text(
                                          '테이블 리셋',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        )))
                              ],
                            ),
                          ),
                          // 각 테이블 영역 카드에 주문메뉴 3개까지만 리스팅
                          const SizedBox(height: 8),
                          ...orderGroup.orders.take(3).map((order) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order.menuList
                                            .map((menu) => menu.menuName)
                                            .join(', '),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),

                                    ],
                                  ),
                                ),
                                Text(
                                  '${order.menuList.map((menu) => menu.quantity).reduce((a, b) => a + b)}개',
                                  style: const TextStyle(
                                      color: Color(0xFFAAAAAA),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
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
                          // 각 테이블 영역 하단 영역UI(외 항목 및 총 금액)
                          SizedBox(
                            height: 38,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '외 $otherQuantity항목',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF777777)),
                                      ),
                                      Text(
                                        '${f.format(totalPrice)}원',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ])),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });




            },
            staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
            // 각 항목이 전체 열 너비를 사용하도록 하며, 주어진 높이만큼만 공간을 차지하도록 함
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
      );
  }

// 테이블 팝업 화면 UI
  void tableDialog(BuildContext context, OrderGroup orderGroup) {
    var f = NumberFormat('###,###,###,###');
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFF5F5F5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: EdgeInsets.zero,
            // 기본 구성 요소들이 shape 속성을 덮어씌우기 때문에 ClipRRect 위젯 사용
            content: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 800,
                  width: 600,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 팝업창 상단 헤더 부분 UI
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '테이블 ${orderGroup.tableNum}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: orderGroup.orders.isEmpty
                                      ? const Color(0xFF777777)
                                      : const Color(0xFFFF662B)),
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
                      // 주문 상태, 주문 번호, 시간 영역 UI
                      Expanded(
                          child: orderGroup.orders.isEmpty
                              ? const Center(
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 36,
                                      height: 36,
                                      child: Placeholder(),
                                    ),
                                    SizedBox(height: 8),
                                    Text('현재 주문내역이 없어요',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ))
                              : ListView.builder(
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            '현재 주문중',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF662B)),
                                          ),
                                          ...orderGroup.orders.map((order) {
                                            final formattedTime =
                                                DateFormat('HH:mm')
                                                    .format(order.orderDate);
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '주문번호 ${order.orderNum}',
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      ' ($formattedTime)',
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFF777777),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ...order.menuList.map((menu) =>
                                                    Column(children: [
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 16,
                                                                vertical: 8),
                                                        width: 400,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xFFF5F5F5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${menu.menuName}, ${menu.quantity}개',
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  menu.selectedOptions
                                                                      .map((option) =>
                                                                          option
                                                                              .menuOptionName)
                                                                      .join(
                                                                          ' / '),
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                        0xFF777777),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '${f.format(menu.menuTotalPrice)}원',
                                                                  style: const TextStyle(
                                                                      color: Color(
                                                                          0xFF777777),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ])),
                                                const SizedBox(
                                                  height: 16,
                                                )
                                              ],
                                            );
                                          }),

                                          const SizedBox(height: 8),
                                          // 점선 부터 총 금액 영역 UI
                                          CustomPaint(
                                            painter: DotDivider(),
                                            size:
                                                const Size(double.infinity, 3),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  '총 금액',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  '${f.format(orderGroup.totalOrderPrice)}원',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }))
                    ],
                  ),
                )),
          );
        });
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
