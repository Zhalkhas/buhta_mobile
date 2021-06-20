// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BillModelTearOff {
  const _$BillModelTearOff();

// ignore: unused_element
  _BillModel call(
      {@HiveField(0) String id,
      @HiveField(1) int number,
      @HiveField(2) DateTime date,
      @HiveField(3) List<ProductModel> products,
      @HiveField(4) BillModelStatus status}) {
    return _BillModel(
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
const $BillModel = _$BillModelTearOff();

/// @nodoc
mixin _$BillModel {
  @HiveField(0)
  String get id;
  @HiveField(1)
  int get number;
  @HiveField(2)
  DateTime get date;
  @HiveField(3)
  List<ProductModel> get products;
  @HiveField(4)
  BillModelStatus get status;

  @JsonKey(ignore: true)
  $BillModelCopyWith<BillModel> get copyWith;
}

/// @nodoc
abstract class $BillModelCopyWith<$Res> {
  factory $BillModelCopyWith(BillModel value, $Res Function(BillModel) then) =
      _$BillModelCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) int number,
      @HiveField(2) DateTime date,
      @HiveField(3) List<ProductModel> products,
      @HiveField(4) BillModelStatus status});
}

/// @nodoc
class _$BillModelCopyWithImpl<$Res> implements $BillModelCopyWith<$Res> {
  _$BillModelCopyWithImpl(this._value, this._then);

  final BillModel _value;
  // ignore: unused_field
  final $Res Function(BillModel) _then;

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
      products: products == freezed
          ? _value.products
          : products as List<ProductModel>,
      status: status == freezed ? _value.status : status as BillModelStatus,
    ));
  }
}

/// @nodoc
abstract class _$BillModelCopyWith<$Res> implements $BillModelCopyWith<$Res> {
  factory _$BillModelCopyWith(
          _BillModel value, $Res Function(_BillModel) then) =
      __$BillModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) int number,
      @HiveField(2) DateTime date,
      @HiveField(3) List<ProductModel> products,
      @HiveField(4) BillModelStatus status});
}

/// @nodoc
class __$BillModelCopyWithImpl<$Res> extends _$BillModelCopyWithImpl<$Res>
    implements _$BillModelCopyWith<$Res> {
  __$BillModelCopyWithImpl(_BillModel _value, $Res Function(_BillModel) _then)
      : super(_value, (v) => _then(v as _BillModel));

  @override
  _BillModel get _value => super._value as _BillModel;

  @override
  $Res call({
    Object id = freezed,
    Object number = freezed,
    Object date = freezed,
    Object products = freezed,
    Object status = freezed,
  }) {
    return _then(_BillModel(
      id: id == freezed ? _value.id : id as String,
      number: number == freezed ? _value.number : number as int,
      date: date == freezed ? _value.date : date as DateTime,
      products: products == freezed
          ? _value.products
          : products as List<ProductModel>,
      status: status == freezed ? _value.status : status as BillModelStatus,
    ));
  }
}

@HiveType(typeId: 1, adapterName: 'BillModelAdapter')

/// @nodoc
class _$_BillModel implements _BillModel {
  _$_BillModel(
      {@HiveField(0) this.id,
      @HiveField(1) this.number,
      @HiveField(2) this.date,
      @HiveField(3) this.products,
      @HiveField(4) this.status});

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final int number;
  @override
  @HiveField(2)
  final DateTime date;
  @override
  @HiveField(3)
  final List<ProductModel> products;
  @override
  @HiveField(4)
  final BillModelStatus status;

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

  @override
  String toString() {
    return 'BillModel(id: $id, number: $number, date: $date, products: $products, status: $status, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BillModel &&
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
  _$BillModelCopyWith<_BillModel> get copyWith =>
      __$BillModelCopyWithImpl<_BillModel>(this, _$identity);
}

abstract class _BillModel implements BillModel {
  factory _BillModel(
      {@HiveField(0) String id,
      @HiveField(1) int number,
      @HiveField(2) DateTime date,
      @HiveField(3) List<ProductModel> products,
      @HiveField(4) BillModelStatus status}) = _$_BillModel;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  int get number;
  @override
  @HiveField(2)
  DateTime get date;
  @override
  @HiveField(3)
  List<ProductModel> get products;
  @override
  @HiveField(4)
  BillModelStatus get status;
  @override
  @JsonKey(ignore: true)
  _$BillModelCopyWith<_BillModel> get copyWith;
}
