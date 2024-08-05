import 'package:freezed_annotation/freezed_annotation.dart';

part 'grouped_tables_model.freezed.dart';
part 'grouped_tables_model.g.dart';

@freezed
class TableResponse with _$TableResponse {
  factory TableResponse({
    required List<OrderGroup> data,
  }) = _TableResponse;

  factory TableResponse.fromJson(Map<String, dynamic> json) => _$TableResponseFromJson(json);
}

@freezed
class OrderGroup with _$OrderGroup {
  factory OrderGroup({
    required int orderGroupNum,
    required int tableNum,
    required int totalOrderPrice,
    required List<Order> orders,
  }) = _OrderGroup;

  factory OrderGroup.fromJson(Map<String, dynamic> json) => _$OrderGroupFromJson(json);
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
