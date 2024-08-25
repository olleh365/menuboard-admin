import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:menuboard_admin/controllers/serving_screen_controller.dart';



class ServingScreen extends StatelessWidget {
  ServingScreen({super.key});

  final ServingScreenController controller = Get.put(ServingScreenController());


  @override
  Widget build(BuildContext context) {

    return Obx((){
      // 승인된 주문 테이블 영역
      return ListView.builder(
        itemCount: controller.orders.length,
        itemBuilder: (context, index) {
          final order = controller.orders[index];
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
                                    final allChecked = controller.checkedItems[index]
                                        ?.values
                                        .every((checked) => checked) ??
                                    false;
                                    controller.checkedItems[index] = Map.fromEntries(
                                    order.menuList.map((item) => MapEntry(
                                    order.menuList.indexOf(item),
                                    !allChecked)),
                                    );
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
                      final isChecked = controller.checkedItems[index]?[itemIndex] ?? false;

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
                                  controller.checkedItems[index] ??= {};
                                  controller.checkedItems[index]![itemIndex] =
                                      value ?? false;
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
    });

  }
}
