import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderResponse with _$OrderResponse {
  factory OrderResponse({
    required List<Order> data,
  }) = _OrderResponse;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => _$OrderResponseFromJson(json);
}

@freezed
class Order with _$Order {
  factory Order({
    required int orderSeq,
    required int memberSeq,
    required int storeSeq,
    required String orderNum,
    required String orderStatus,
    required int tableNum,
    required int orderTotalPrice,
    required int orderTotalOriginalPrice,
    required DateTime orderDate,
    required DateTime orderCompleteDate,
    required int orderGroupNum,
    required List<Menu> menuList,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class Menu with _$Menu {
  factory Menu({
    required int orderMenuSeq,
    required String orderMenuDelYn,
    required int menuSeq,
    required String menuName,
    required int quantity,
    required int menuTotalPrice,
    required int menuTotalOriginalPrice,
    required List<Option> selectedOptions,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}

@freezed
class Option with _$Option {
  factory Option({
    required int menuOptionSeq,
    required String menuOptionName,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
