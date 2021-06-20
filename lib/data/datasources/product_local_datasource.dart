import 'package:hive/hive.dart';

import '../models/product_model.dart';

final _mockData = [
  ProductModel(
    id: "0",
    name: "Йогурт Frutis",
    price: 350,
    sku: "112345235",
  ),
  ProductModel(
    id: "1",
    name: "USB кабель Type-C",
    price: 570,
    sku: "112345978",
  ),
  ProductModel(
    id: "2",
    name: "Ручка шариковая",
    price: 50,
    sku: "456457457",
  ),
];

/// Class manages access to [ProductModel] instances
/// stored in local [Hive] db
class ProductLocalDataSource {
  final _productBoxName = 'product-box';

  /// Gets all available [ProductModel] objects in db
  Future<List<ProductModel>> getAllModels() async {
    final box = await Hive.openBox(_productBoxName);
    final values = box.values;
    if (values.isEmpty) {
      await box.addAll(_mockData);
      return _mockData;
    }
    final res = List<ProductModel>.from(box.values);
    return res;
  }

  Future addNewModel(ProductModel model) async {
    final box = await Hive.openBox(_productBoxName);
    await box.add(model);
  }
}
