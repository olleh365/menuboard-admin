// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return _OrderResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderResponse {
  List<Order> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderResponseCopyWith<OrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderResponseCopyWith<$Res> {
  factory $OrderResponseCopyWith(
          OrderResponse value, $Res Function(OrderResponse) then) =
      _$OrderResponseCopyWithImpl<$Res, OrderResponse>;
  @useResult
  $Res call({List<Order> data});
}

/// @nodoc
class _$OrderResponseCopyWithImpl<$Res, $Val extends OrderResponse>
    implements $OrderResponseCopyWith<$Res> {
  _$OrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderResponseImplCopyWith<$Res>
    implements $OrderResponseCopyWith<$Res> {
  factory _$$OrderResponseImplCopyWith(
          _$OrderResponseImpl value, $Res Function(_$OrderResponseImpl) then) =
      __$$OrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Order> data});
}

/// @nodoc
class __$$OrderResponseImplCopyWithImpl<$Res>
    extends _$OrderResponseCopyWithImpl<$Res, _$OrderResponseImpl>
    implements _$$OrderResponseImplCopyWith<$Res> {
  __$$OrderResponseImplCopyWithImpl(
      _$OrderResponseImpl _value, $Res Function(_$OrderResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$OrderResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderResponseImpl implements _OrderResponse {
  _$OrderResponseImpl({required final List<Order> data}) : _data = data;

  factory _$OrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderResponseImplFromJson(json);

  final List<Order> _data;
  @override
  List<Order> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'OrderResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderResponseImplCopyWith<_$OrderResponseImpl> get copyWith =>
      __$$OrderResponseImplCopyWithImpl<_$OrderResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderResponseImplToJson(
      this,
    );
  }
}

abstract class _OrderResponse implements OrderResponse {
  factory _OrderResponse({required final List<Order> data}) =
      _$OrderResponseImpl;

  factory _OrderResponse.fromJson(Map<String, dynamic> json) =
      _$OrderResponseImpl.fromJson;

  @override
  List<Order> get data;
  @override
  @JsonKey(ignore: true)
  _$$OrderResponseImplCopyWith<_$OrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int get orderSeq => throw _privateConstructorUsedError;
  int get memberSeq => throw _privateConstructorUsedError;
  int get storeSeq => throw _privateConstructorUsedError;
  String get orderNum => throw _privateConstructorUsedError;
  String get orderStatus => throw _privateConstructorUsedError;
  int get tableNum => throw _privateConstructorUsedError;
  int get orderTotalPrice => throw _privateConstructorUsedError;
  int get orderTotalOriginalPrice => throw _privateConstructorUsedError;
  DateTime get orderDate => throw _privateConstructorUsedError;
  DateTime get orderCompleteDate => throw _privateConstructorUsedError;
  int get orderGroupNum => throw _privateConstructorUsedError;
  List<Menu> get menuList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int orderSeq,
      int memberSeq,
      int storeSeq,
      String orderNum,
      String orderStatus,
      int tableNum,
      int orderTotalPrice,
      int orderTotalOriginalPrice,
      DateTime orderDate,
      DateTime orderCompleteDate,
      int orderGroupNum,
      List<Menu> menuList});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderSeq = null,
    Object? memberSeq = null,
    Object? storeSeq = null,
    Object? orderNum = null,
    Object? orderStatus = null,
    Object? tableNum = null,
    Object? orderTotalPrice = null,
    Object? orderTotalOriginalPrice = null,
    Object? orderDate = null,
    Object? orderCompleteDate = null,
    Object? orderGroupNum = null,
    Object? menuList = null,
  }) {
    return _then(_value.copyWith(
      orderSeq: null == orderSeq
          ? _value.orderSeq
          : orderSeq // ignore: cast_nullable_to_non_nullable
              as int,
      memberSeq: null == memberSeq
          ? _value.memberSeq
          : memberSeq // ignore: cast_nullable_to_non_nullable
              as int,
      storeSeq: null == storeSeq
          ? _value.storeSeq
          : storeSeq // ignore: cast_nullable_to_non_nullable
              as int,
      orderNum: null == orderNum
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      tableNum: null == tableNum
          ? _value.tableNum
          : tableNum // ignore: cast_nullable_to_non_nullable
              as int,
      orderTotalPrice: null == orderTotalPrice
          ? _value.orderTotalPrice
          : orderTotalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      orderTotalOriginalPrice: null == orderTotalOriginalPrice
          ? _value.orderTotalOriginalPrice
          : orderTotalOriginalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderCompleteDate: null == orderCompleteDate
          ? _value.orderCompleteDate
          : orderCompleteDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderGroupNum: null == orderGroupNum
          ? _value.orderGroupNum
          : orderGroupNum // ignore: cast_nullable_to_non_nullable
              as int,
      menuList: null == menuList
          ? _value.menuList
          : menuList // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int orderSeq,
      int memberSeq,
      int storeSeq,
      String orderNum,
      String orderStatus,
      int tableNum,
      int orderTotalPrice,
      int orderTotalOriginalPrice,
      DateTime orderDate,
      DateTime orderCompleteDate,
      int orderGroupNum,
      List<Menu> menuList});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderSeq = null,
    Object? memberSeq = null,
    Object? storeSeq = null,
    Object? orderNum = null,
    Object? orderStatus = null,
    Object? tableNum = null,
    Object? orderTotalPrice = null,
    Object? orderTotalOriginalPrice = null,
    Object? orderDate = null,
    Object? orderCompleteDate = null,
    Object? orderGroupNum = null,
    Object? menuList = null,
  }) {
    return _then(_$OrderImpl(
      orderSeq: null == orderSeq
          ? _value.orderSeq
          : orderSeq // ignore: cast_nullable_to_non_nullable
              as int,
      memberSeq: null == memberSeq
          ? _value.memberSeq
          : memberSeq // ignore: cast_nullable_to_non_nullable
              as int,
      storeSeq: null == storeSeq
          ? _value.storeSeq
          : storeSeq // ignore: cast_nullable_to_non_nullable
              as int,
      orderNum: null == orderNum
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      tableNum: null == tableNum
          ? _value.tableNum
          : tableNum // ignore: cast_nullable_to_non_nullable
              as int,
      orderTotalPrice: null == orderTotalPrice
          ? _value.orderTotalPrice
          : orderTotalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      orderTotalOriginalPrice: null == orderTotalOriginalPrice
          ? _value.orderTotalOriginalPrice
          : orderTotalOriginalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderCompleteDate: null == orderCompleteDate
          ? _value.orderCompleteDate
          : orderCompleteDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderGroupNum: null == orderGroupNum
          ? _value.orderGroupNum
          : orderGroupNum // ignore: cast_nullable_to_non_nullable
              as int,
      menuList: null == menuList
          ? _value._menuList
          : menuList // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  _$OrderImpl(
      {required this.orderSeq,
      required this.memberSeq,
      required this.storeSeq,
      required this.orderNum,
      required this.orderStatus,
      required this.tableNum,
      required this.orderTotalPrice,
      required this.orderTotalOriginalPrice,
      required this.orderDate,
      required this.orderCompleteDate,
      required this.orderGroupNum,
      required final List<Menu> menuList})
      : _menuList = menuList;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final int orderSeq;
  @override
  final int memberSeq;
  @override
  final int storeSeq;
  @override
  final String orderNum;
  @override
  final String orderStatus;
  @override
  final int tableNum;
  @override
  final int orderTotalPrice;
  @override
  final int orderTotalOriginalPrice;
  @override
  final DateTime orderDate;
  @override
  final DateTime orderCompleteDate;
  @override
  final int orderGroupNum;
  final List<Menu> _menuList;
  @override
  List<Menu> get menuList {
    if (_menuList is EqualUnmodifiableListView) return _menuList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuList);
  }

  @override
  String toString() {
    return 'Order(orderSeq: $orderSeq, memberSeq: $memberSeq, storeSeq: $storeSeq, orderNum: $orderNum, orderStatus: $orderStatus, tableNum: $tableNum, orderTotalPrice: $orderTotalPrice, orderTotalOriginalPrice: $orderTotalOriginalPrice, orderDate: $orderDate, orderCompleteDate: $orderCompleteDate, orderGroupNum: $orderGroupNum, menuList: $menuList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.orderSeq, orderSeq) ||
                other.orderSeq == orderSeq) &&
            (identical(other.memberSeq, memberSeq) ||
                other.memberSeq == memberSeq) &&
            (identical(other.storeSeq, storeSeq) ||
                other.storeSeq == storeSeq) &&
            (identical(other.orderNum, orderNum) ||
                other.orderNum == orderNum) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.tableNum, tableNum) ||
                other.tableNum == tableNum) &&
            (identical(other.orderTotalPrice, orderTotalPrice) ||
                other.orderTotalPrice == orderTotalPrice) &&
            (identical(
                    other.orderTotalOriginalPrice, orderTotalOriginalPrice) ||
                other.orderTotalOriginalPrice == orderTotalOriginalPrice) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.orderCompleteDate, orderCompleteDate) ||
                other.orderCompleteDate == orderCompleteDate) &&
            (identical(other.orderGroupNum, orderGroupNum) ||
                other.orderGroupNum == orderGroupNum) &&
            const DeepCollectionEquality().equals(other._menuList, _menuList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderSeq,
      memberSeq,
      storeSeq,
      orderNum,
      orderStatus,
      tableNum,
      orderTotalPrice,
      orderTotalOriginalPrice,
      orderDate,
      orderCompleteDate,
      orderGroupNum,
      const DeepCollectionEquality().hash(_menuList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  factory _Order(
      {required final int orderSeq,
      required final int memberSeq,
      required final int storeSeq,
      required final String orderNum,
      required final String orderStatus,
      required final int tableNum,
      required final int orderTotalPrice,
      required final int orderTotalOriginalPrice,
      required final DateTime orderDate,
      required final DateTime orderCompleteDate,
      required final int orderGroupNum,
      required final List<Menu> menuList}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  int get orderSeq;
  @override
  int get memberSeq;
  @override
  int get storeSeq;
  @override
  String get orderNum;
  @override
  String get orderStatus;
  @override
  int get tableNum;
  @override
  int get orderTotalPrice;
  @override
  int get orderTotalOriginalPrice;
  @override
  DateTime get orderDate;
  @override
  DateTime get orderCompleteDate;
  @override
  int get orderGroupNum;
  @override
  List<Menu> get menuList;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return _Menu.fromJson(json);
}

/// @nodoc
mixin _$Menu {
  int get orderMenuSeq => throw _privateConstructorUsedError;
  String get orderMenuDelYn => throw _privateConstructorUsedError;
  int get menuSeq => throw _privateConstructorUsedError;
  String get menuName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get menuTotalPrice => throw _privateConstructorUsedError;
  int get menuTotalOriginalPrice => throw _privateConstructorUsedError;
  List<Option> get selectedOptions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res, Menu>;
  @useResult
  $Res call(
      {int orderMenuSeq,
      String orderMenuDelYn,
      int menuSeq,
      String menuName,
      int quantity,
      int menuTotalPrice,
      int menuTotalOriginalPrice,
      List<Option> selectedOptions});
}

/// @nodoc
class _$MenuCopyWithImpl<$Res, $Val extends Menu>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderMenuSeq = null,
    Object? orderMenuDelYn = null,
    Object? menuSeq = null,
    Object? menuName = null,
    Object? quantity = null,
    Object? menuTotalPrice = null,
    Object? menuTotalOriginalPrice = null,
    Object? selectedOptions = null,
  }) {
    return _then(_value.copyWith(
      orderMenuSeq: null == orderMenuSeq
          ? _value.orderMenuSeq
          : orderMenuSeq // ignore: cast_nullable_to_non_nullable
              as int,
      orderMenuDelYn: null == orderMenuDelYn
          ? _value.orderMenuDelYn
          : orderMenuDelYn // ignore: cast_nullable_to_non_nullable
              as String,
      menuSeq: null == menuSeq
          ? _value.menuSeq
          : menuSeq // ignore: cast_nullable_to_non_nullable
              as int,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      menuTotalPrice: null == menuTotalPrice
          ? _value.menuTotalPrice
          : menuTotalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      menuTotalOriginalPrice: null == menuTotalOriginalPrice
          ? _value.menuTotalOriginalPrice
          : menuTotalOriginalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      selectedOptions: null == selectedOptions
          ? _value.selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuImplCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$$MenuImplCopyWith(
          _$MenuImpl value, $Res Function(_$MenuImpl) then) =
      __$$MenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int orderMenuSeq,
      String orderMenuDelYn,
      int menuSeq,
      String menuName,
      int quantity,
      int menuTotalPrice,
      int menuTotalOriginalPrice,
      List<Option> selectedOptions});
}

/// @nodoc
class __$$MenuImplCopyWithImpl<$Res>
    extends _$MenuCopyWithImpl<$Res, _$MenuImpl>
    implements _$$MenuImplCopyWith<$Res> {
  __$$MenuImplCopyWithImpl(_$MenuImpl _value, $Res Function(_$MenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderMenuSeq = null,
    Object? orderMenuDelYn = null,
    Object? menuSeq = null,
    Object? menuName = null,
    Object? quantity = null,
    Object? menuTotalPrice = null,
    Object? menuTotalOriginalPrice = null,
    Object? selectedOptions = null,
  }) {
    return _then(_$MenuImpl(
      orderMenuSeq: null == orderMenuSeq
          ? _value.orderMenuSeq
          : orderMenuSeq // ignore: cast_nullable_to_non_nullable
              as int,
      orderMenuDelYn: null == orderMenuDelYn
          ? _value.orderMenuDelYn
          : orderMenuDelYn // ignore: cast_nullable_to_non_nullable
              as String,
      menuSeq: null == menuSeq
          ? _value.menuSeq
          : menuSeq // ignore: cast_nullable_to_non_nullable
              as int,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      menuTotalPrice: null == menuTotalPrice
          ? _value.menuTotalPrice
          : menuTotalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      menuTotalOriginalPrice: null == menuTotalOriginalPrice
          ? _value.menuTotalOriginalPrice
          : menuTotalOriginalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      selectedOptions: null == selectedOptions
          ? _value._selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuImpl implements _Menu {
  _$MenuImpl(
      {required this.orderMenuSeq,
      required this.orderMenuDelYn,
      required this.menuSeq,
      required this.menuName,
      required this.quantity,
      required this.menuTotalPrice,
      required this.menuTotalOriginalPrice,
      required final List<Option> selectedOptions})
      : _selectedOptions = selectedOptions;

  factory _$MenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuImplFromJson(json);

  @override
  final int orderMenuSeq;
  @override
  final String orderMenuDelYn;
  @override
  final int menuSeq;
  @override
  final String menuName;
  @override
  final int quantity;
  @override
  final int menuTotalPrice;
  @override
  final int menuTotalOriginalPrice;
  final List<Option> _selectedOptions;
  @override
  List<Option> get selectedOptions {
    if (_selectedOptions is EqualUnmodifiableListView) return _selectedOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedOptions);
  }

  @override
  String toString() {
    return 'Menu(orderMenuSeq: $orderMenuSeq, orderMenuDelYn: $orderMenuDelYn, menuSeq: $menuSeq, menuName: $menuName, quantity: $quantity, menuTotalPrice: $menuTotalPrice, menuTotalOriginalPrice: $menuTotalOriginalPrice, selectedOptions: $selectedOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuImpl &&
            (identical(other.orderMenuSeq, orderMenuSeq) ||
                other.orderMenuSeq == orderMenuSeq) &&
            (identical(other.orderMenuDelYn, orderMenuDelYn) ||
                other.orderMenuDelYn == orderMenuDelYn) &&
            (identical(other.menuSeq, menuSeq) || other.menuSeq == menuSeq) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.menuTotalPrice, menuTotalPrice) ||
                other.menuTotalPrice == menuTotalPrice) &&
            (identical(other.menuTotalOriginalPrice, menuTotalOriginalPrice) ||
                other.menuTotalOriginalPrice == menuTotalOriginalPrice) &&
            const DeepCollectionEquality()
                .equals(other._selectedOptions, _selectedOptions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderMenuSeq,
      orderMenuDelYn,
      menuSeq,
      menuName,
      quantity,
      menuTotalPrice,
      menuTotalOriginalPrice,
      const DeepCollectionEquality().hash(_selectedOptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      __$$MenuImplCopyWithImpl<_$MenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuImplToJson(
      this,
    );
  }
}

abstract class _Menu implements Menu {
  factory _Menu(
      {required final int orderMenuSeq,
      required final String orderMenuDelYn,
      required final int menuSeq,
      required final String menuName,
      required final int quantity,
      required final int menuTotalPrice,
      required final int menuTotalOriginalPrice,
      required final List<Option> selectedOptions}) = _$MenuImpl;

  factory _Menu.fromJson(Map<String, dynamic> json) = _$MenuImpl.fromJson;

  @override
  int get orderMenuSeq;
  @override
  String get orderMenuDelYn;
  @override
  int get menuSeq;
  @override
  String get menuName;
  @override
  int get quantity;
  @override
  int get menuTotalPrice;
  @override
  int get menuTotalOriginalPrice;
  @override
  List<Option> get selectedOptions;
  @override
  @JsonKey(ignore: true)
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Option _$OptionFromJson(Map<String, dynamic> json) {
  return _Option.fromJson(json);
}

/// @nodoc
mixin _$Option {
  int get menuOptionSeq => throw _privateConstructorUsedError;
  String get menuOptionName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionCopyWith<Option> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) then) =
      _$OptionCopyWithImpl<$Res, Option>;
  @useResult
  $Res call({int menuOptionSeq, String menuOptionName});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res, $Val extends Option>
    implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuOptionSeq = null,
    Object? menuOptionName = null,
  }) {
    return _then(_value.copyWith(
      menuOptionSeq: null == menuOptionSeq
          ? _value.menuOptionSeq
          : menuOptionSeq // ignore: cast_nullable_to_non_nullable
              as int,
      menuOptionName: null == menuOptionName
          ? _value.menuOptionName
          : menuOptionName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionImplCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$$OptionImplCopyWith(
          _$OptionImpl value, $Res Function(_$OptionImpl) then) =
      __$$OptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int menuOptionSeq, String menuOptionName});
}

/// @nodoc
class __$$OptionImplCopyWithImpl<$Res>
    extends _$OptionCopyWithImpl<$Res, _$OptionImpl>
    implements _$$OptionImplCopyWith<$Res> {
  __$$OptionImplCopyWithImpl(
      _$OptionImpl _value, $Res Function(_$OptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuOptionSeq = null,
    Object? menuOptionName = null,
  }) {
    return _then(_$OptionImpl(
      menuOptionSeq: null == menuOptionSeq
          ? _value.menuOptionSeq
          : menuOptionSeq // ignore: cast_nullable_to_non_nullable
              as int,
      menuOptionName: null == menuOptionName
          ? _value.menuOptionName
          : menuOptionName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionImpl implements _Option {
  _$OptionImpl({required this.menuOptionSeq, required this.menuOptionName});

  factory _$OptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionImplFromJson(json);

  @override
  final int menuOptionSeq;
  @override
  final String menuOptionName;

  @override
  String toString() {
    return 'Option(menuOptionSeq: $menuOptionSeq, menuOptionName: $menuOptionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionImpl &&
            (identical(other.menuOptionSeq, menuOptionSeq) ||
                other.menuOptionSeq == menuOptionSeq) &&
            (identical(other.menuOptionName, menuOptionName) ||
                other.menuOptionName == menuOptionName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, menuOptionSeq, menuOptionName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      __$$OptionImplCopyWithImpl<_$OptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionImplToJson(
      this,
    );
  }
}

abstract class _Option implements Option {
  factory _Option(
      {required final int menuOptionSeq,
      required final String menuOptionName}) = _$OptionImpl;

  factory _Option.fromJson(Map<String, dynamic> json) = _$OptionImpl.fromJson;

  @override
  int get menuOptionSeq;
  @override
  String get menuOptionName;
  @override
  @JsonKey(ignore: true)
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
