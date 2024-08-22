import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menuboard_admin/controllers/kitchen_screen_controller.dart';

class KitchenScreen extends StatelessWidget {
  final KitchenScreenController controller = Get.put(KitchenScreenController());

  KitchenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final orderItems = controller.order.expand((order) => order.menuList).toList();

      return ListView.builder(
        itemCount: orderItems.length,
        itemBuilder: (context, index) {
          final orderItem = orderItems[index];
          final order = controller.order.firstWhere((order) => order.menuList.contains(orderItem));
          final isChecked = controller.checkedItems[index] ?? false;

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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                Text(
                                  '테이블 ${order.tableNum}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF777777),
                                      decoration: isChecked ? TextDecoration.lineThrough : null,
                                      decorationColor: const Color(0xFF777777)),
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
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  orderItem.selectedOptions.map((addItem) => addItem.menuOptionName).join(' 추가 / '),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF777777),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              controller.menuCheckbox(index, value ?? false);
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
                    const Divider(height: 1, thickness: 1, color: Color(0xFFDFDFDF)),
                  ],
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
