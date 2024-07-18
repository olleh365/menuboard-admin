// exam_menu_model.dart
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

  double get totalPrice => items.fold(0, (total, item) => total + item.totalPrice);
}

class OrderItem {
  final String mainMenu;
  final double mainMenuPrice;
  final List<AdditionalMenuItem> additionalMenu;
  final int quantity;

  OrderItem({
    required this.mainMenu,
    required this.mainMenuPrice,
    required this.additionalMenu,
    required this.quantity,
  });

  double get totalPrice {
    double additionalPrice = additionalMenu.fold(0, (total, item) => total + item.price);
    return (mainMenuPrice + additionalPrice) * quantity;
  }
}

class AdditionalMenuItem {
  final String name;
  final double price;

  AdditionalMenuItem({
    required this.name,
    required this.price,
  });
}
