import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecase.dart';
import '../entites/product.dart';
import '../repos/product_repo.dart';

/// Adds new [Product] to the storage
class AddNewProduct implements UseCase<void, AddNewProductParams> {
  /// [ProductRepository]
  final ProductRepository repo;

  ///
  AddNewProduct(this.repo);

  @override
  Future<Either<Failure, void>> call(AddNewProductParams params) async {
    final failure = await repo.addNewProduct(params.product);
    if (failure != null) {
      return Left(failure);
    }
    return Right(() {});
  }
}

///Parameters for [AddNewProduct] calling
class AddNewProductParams {
  /// [Product] to be added to storage
  final Product product;

  ///
  AddNewProductParams({@required this.product});
}
