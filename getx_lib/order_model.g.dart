// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderResponseImpl _$$OrderResponseImplFromJson(Map<String, dynamic> json) =>
    _$OrderResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderResponseImplToJson(_$OrderResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      orderSeq: (json['orderSeq'] as num).toInt(),
      memberSeq: (json['memberSeq'] as num).toInt(),
      storeSeq: (json['storeSeq'] as num).toInt(),
      orderNum: json['orderNum'] as String,
      orderStatus: json['orderStatus'] as String,
      tableNum: (json['tableNum'] as num).toInt(),
      orderTotalPrice: (json['orderTotalPrice'] as num).toInt(),
      orderTotalOriginalPrice: (json['orderTotalOriginalPrice'] as num).toInt(),
      orderDate: DateTime.parse(json['orderDate'] as String),
      orderCompleteDate: DateTime.parse(json['orderCompleteDate'] as String),
      orderGroupNum: (json['orderGroupNum'] as num).toInt(),
      menuList: (json['menuList'] as List<dynamic>)
          .map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'orderSeq': instance.orderSeq,
      'memberSeq': instance.memberSeq,
      'storeSeq': instance.storeSeq,
      'orderNum': instance.orderNum,
      'orderStatus': instance.orderStatus,
      'tableNum': instance.tableNum,
      'orderTotalPrice': instance.orderTotalPrice,
      'orderTotalOriginalPrice': instance.orderTotalOriginalPrice,
      'orderDate': instance.orderDate.toIso8601String(),
      'orderCompleteDate': instance.orderCompleteDate.toIso8601String(),
      'orderGroupNum': instance.orderGroupNum,
      'menuList': instance.menuList,
    };

_$MenuImpl _$$MenuImplFromJson(Map<String, dynamic> json) => _$MenuImpl(
      orderMenuSeq: (json['orderMenuSeq'] as num).toInt(),
      orderMenuDelYn: json['orderMenuDelYn'] as String,
      menuSeq: (json['menuSeq'] as num).toInt(),
      menuName: json['menuName'] as String,
      quantity: (json['quantity'] as num).toInt(),
      menuTotalPrice: (json['menuTotalPrice'] as num).toInt(),
      menuTotalOriginalPrice: (json['menuTotalOriginalPrice'] as num).toInt(),
      selectedOptions: (json['selectedOptions'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MenuImplToJson(_$MenuImpl instance) =>
    <String, dynamic>{
      'orderMenuSeq': instance.orderMenuSeq,
      'orderMenuDelYn': instance.orderMenuDelYn,
      'menuSeq': instance.menuSeq,
      'menuName': instance.menuName,
      'quantity': instance.quantity,
      'menuTotalPrice': instance.menuTotalPrice,
      'menuTotalOriginalPrice': instance.menuTotalOriginalPrice,
      'selectedOptions': instance.selectedOptions,
    };

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
      menuOptionSeq: (json['menuOptionSeq'] as num).toInt(),
      menuOptionName: json['menuOptionName'] as String,
    );

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'menuOptionSeq': instance.menuOptionSeq,
      'menuOptionName': instance.menuOptionName,
    };
