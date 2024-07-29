// 테이블 영역
class Order {
  final String orderNumber;
  final DateTime orderTime;
  final int tableNumber;
  final List<OrderItem> items;

  Order({
    required this.orderNumber,
    required this.orderTime,
    required this.tableNumber,
    required this.items,
  });

  // 한 테이블 영역에 대한 총 금액
  double get totalPrice =>
      items.fold(0, (total, item) => total + item.totalPrice);
}
// 각 주문 리스트
class OrderItem {
  final String mainMenu;
  final int mainMenuPrice;
  final List<AdditionalMenuItem> additionalMenu;
  final int quantity;

  OrderItem({
    required this.mainMenu,
    required this.mainMenuPrice,
    required this.additionalMenu,
    required this.quantity,
  });

  // 한 메뉴의 총 금액
  double get totalPrice {
    double additionalPrice =
        additionalMenu.fold(0, (total, item) => total + item.price);
    return (mainMenuPrice + additionalPrice) * quantity;
  }
}

// 추가 주문
class AdditionalMenuItem {
  final String name;
  final int price;

  AdditionalMenuItem({
    required this.name,
    required this.price,
  });
}
