import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entites/product.dart';

/// Class manages [Product] storage
abstract class ProductRepository {
  /// Return all available [Product]s
  Future<Either<Failure, List<Product>>> getAllProducts();

  /// Creates new [product] in storage
  Future<Failure> addNewProduct(Product product);
}
