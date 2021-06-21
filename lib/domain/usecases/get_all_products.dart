import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecase.dart';
import '../entites/product.dart';
import '../repos/product_repo.dart';

/// Gets all available [Product]s from storage
class GetAllProducts implements UseCase<List<Product>, void> {
  /// [ProductRepository]
  final ProductRepository repo;

  ///
  GetAllProducts(this.repo);

  @override
  Future<Either<Failure, List<Product>>> call(void params) async =>
      await repo.getAllProducts();
}
