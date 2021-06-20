// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProductModelTearOff {
  const _$ProductModelTearOff();

// ignore: unused_element
  _ProductModel call(
      {@required @HiveField(0) String id,
      @required @HiveField(1) String name,
      @required @HiveField(2) String sku,
      @required @HiveField(3) double price}) {
    return _ProductModel(
      id: id,
      name: name,
      sku: sku,
      price: price,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ProductModel = _$ProductModelTearOff();

/// @nodoc
mixin _$ProductModel {
  @HiveField(0)
  String get id;
  @HiveField(1)
  String get name;
  @HiveField(2)
  String get sku;
  @HiveField(3)
  double get price;

  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String sku,
      @HiveField(3) double price});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  final ProductModel _value;
  // ignore: unused_field
  final $Res Function(ProductModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object sku = freezed,
    Object price = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      sku: sku == freezed ? _value.sku : sku as String,
      price: price == freezed ? _value.price : price as double,
    ));
  }
}

/// @nodoc
abstract class _$ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(
          _ProductModel value, $Res Function(_ProductModel) then) =
      __$ProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String sku,
      @HiveField(3) double price});
}

/// @nodoc
class __$ProductModelCopyWithImpl<$Res> extends _$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(
      _ProductModel _value, $Res Function(_ProductModel) _then)
      : super(_value, (v) => _then(v as _ProductModel));

  @override
  _ProductModel get _value => super._value as _ProductModel;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object sku = freezed,
    Object price = freezed,
  }) {
    return _then(_ProductModel(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      sku: sku == freezed ? _value.sku : sku as String,
      price: price == freezed ? _value.price : price as double,
    ));
  }
}

@HiveType(typeId: 0, adapterName: 'ProductModelAdapter')

/// @nodoc
class _$_ProductModel implements _ProductModel {
  const _$_ProductModel(
      {@required @HiveField(0) this.id,
      @required @HiveField(1) this.name,
      @required @HiveField(2) this.sku,
      @required @HiveField(3) this.price})
      : assert(id != null),
        assert(name != null),
        assert(sku != null),
        assert(price != null);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String sku;
  @override
  @HiveField(3)
  final double price;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, sku: $sku, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.sku, sku) ||
                const DeepCollectionEquality().equals(other.sku, sku)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(sku) ^
      const DeepCollectionEquality().hash(price);

  @JsonKey(ignore: true)
  @override
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {@required @HiveField(0) String id,
      @required @HiveField(1) String name,
      @required @HiveField(2) String sku,
      @required @HiveField(3) double price}) = _$_ProductModel;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get sku;
  @override
  @HiveField(3)
  double get price;
  @override
  @JsonKey(ignore: true)
  _$ProductModelCopyWith<_ProductModel> get copyWith;
}
