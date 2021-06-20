import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../core/errors/failure.dart';
import '../../domain/entites/product.dart';
import '../../domain/repos/product_repo.dart';
import '../datasources/product_local_datasource.dart';
import '../models/product_model.dart';

/// Implementation of [ProductRepository]
class ProductRepositoryImpl implements ProductRepository {
  /// Provider of [ProductModel] from local [Hive] db
  final ProductLocalDataSource localSource;

  ///
  ProductRepositoryImpl(this.localSource);

  @override
  Future<Failure> addNewProduct(Product product) async {
    try {
      await localSource.addNewModel(_productToModel(
        product.copyWith(id: Uuid().v4()),
      ));
      return null;
    } on Exception {
      return CacheFailure();
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      final models = await localSource.getAllModels();
      final products = <Product>[];
      for (final model in models) {
        products.add(_modelToProduct(model));
      }
      return Right(products);
    } on Exception {
      return Left(CacheFailure());
    }
  }

  ProductModel _productToModel(Product product) => ProductModel(
        name: product.name,
        price: product.price,
        sku: product.sku,
        id: product.id,
      );

  Product _modelToProduct(ProductModel model) => Product(
        id: model.id,
        sku: model.sku,
        price: model.price,
        name: model.name,
      );
}
