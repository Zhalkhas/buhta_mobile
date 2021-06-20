import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

/// [ProductModel] is representation of [Product] entity in db
@freezed
abstract class ProductModel with _$ProductModel {
  ///
  @HiveType(typeId: 0, adapterName: 'ProductModelAdapter')
  const factory ProductModel({
    @HiveField(0) @required String id,
    @HiveField(1) @required String name,
    @HiveField(2) @required String sku,
    @HiveField(3) @required double price,
  }) = _ProductModel;
}
