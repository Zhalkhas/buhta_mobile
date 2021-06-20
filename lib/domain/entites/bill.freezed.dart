// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BillTearOff {
  const _$BillTearOff();

// ignore: unused_element
  _Bill call(
      {String id,
      int number,
      DateTime date,
      List<Product> products,
      BillStatus status}) {
    return _Bill(
      id: id,
      number: number,
      date: date,
      products: products,
      status: status,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Bill = _$BillTearOff();

/// @nodoc
mixin _$Bill {
  String get id;
  int get number;
  DateTime get date;
  List<Product> get products;
  BillStatus get status;

  @JsonKey(ignore: true)
  $BillCopyWith<Bill> get copyWith;
}

/// @nodoc
abstract class $BillCopyWith<$Res> {
  factory $BillCopyWith(Bill value, $Res Function(Bill) then) =
      _$BillCopyWithImpl<$Res>;
  $Res call(
      {String id,
      int number,
      DateTime date,
      List<Product> products,
      BillStatus status});
}

/// @nodoc
class _$BillCopyWithImpl<$Res> implements $BillCopyWith<$Res> {
  _$BillCopyWithImpl(this._value, this._then);

  final Bill _value;
  // ignore: unused_field
  final $Res Function(Bill) _then;

  @override
  $Res call({
    Object id = freezed,
    Object number = freezed,
    Object date = freezed,
    Object products = freezed,
    Object status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      number: number == freezed ? _value.number : number as int,
      date: date == freezed ? _value.date : date as DateTime,
      products:
          products == freezed ? _value.products : products as List<Product>,
      status: status == freezed ? _value.status : status as BillStatus,
    ));
  }
}

/// @nodoc
abstract class _$BillCopyWith<$Res> implements $BillCopyWith<$Res> {
  factory _$BillCopyWith(_Bill value, $Res Function(_Bill) then) =
      __$BillCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      int number,
      DateTime date,
      List<Product> products,
      BillStatus status});
}

/// @nodoc
class __$BillCopyWithImpl<$Res> extends _$BillCopyWithImpl<$Res>
    implements _$BillCopyWith<$Res> {
  __$BillCopyWithImpl(_Bill _value, $Res Function(_Bill) _then)
      : super(_value, (v) => _then(v as _Bill));

  @override
  _Bill get _value => super._value as _Bill;

  @override
  $Res call({
    Object id = freezed,
    Object number = freezed,
    Object date = freezed,
    Object products = freezed,
    Object status = freezed,
  }) {
    return _then(_Bill(
      id: id == freezed ? _value.id : id as String,
      number: number == freezed ? _value.number : number as int,
      date: date == freezed ? _value.date : date as DateTime,
      products:
          products == freezed ? _value.products : products as List<Product>,
      status: status == freezed ? _value.status : status as BillStatus,
    ));
  }
}

/// @nodoc
class _$_Bill implements _Bill {
  _$_Bill({this.id, this.number, this.date, this.products, this.status});

  @override
  final String id;
  @override
  final int number;
  @override
  final DateTime date;
  @override
  final List<Product> products;
  @override
  final BillStatus status;

  bool _didtotal = false;
  double _total;

  @override
  double get total {
    if (_didtotal == false) {
      _didtotal = true;
      _total = products.fold(
          0, (previousValue, element) => previousValue + element.price);
    }
    return _total;
  }

  bool _didstatusString = false;
  String _statusString;

  @override
  String get statusString {
    if (_didstatusString == false) {
      _didstatusString = true;
      _statusString = billStatusAsString(status);
    }
    return _statusString;
  }

  @override
  String toString() {
    return 'Bill(id: $id, number: $number, date: $date, products: $products, status: $status, total: $total, statusString: $statusString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Bill &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$BillCopyWith<_Bill> get copyWith =>
      __$BillCopyWithImpl<_Bill>(this, _$identity);
}

abstract class _Bill implements Bill {
  factory _Bill(
      {String id,
      int number,
      DateTime date,
      List<Product> products,
      BillStatus status}) = _$_Bill;

  @override
  String get id;
  @override
  int get number;
  @override
  DateTime get date;
  @override
  List<Product> get products;
  @override
  BillStatus get status;
  @override
  @JsonKey(ignore: true)
  _$BillCopyWith<_Bill> get copyWith;
}
