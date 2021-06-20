import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/product_model.dart';

part 'product.freezed.dart';

///
@freezed
abstract class Product with _$Product {
  ///
  const factory Product({
    String id,
    String name,
    String sku,
    double price,
  }) = _Product;

  /// Create new entity from representation
  /// in db, [ProductModel]
  factory Product.fromModel(ProductModel model) => Product(
        id: model.id,
        price: model.price,
        sku: model.sku,
        name: model.name,
      );
}
