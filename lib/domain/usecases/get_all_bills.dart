import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecase.dart';
import '../entites/bill.dart';
import '../repos/bills_repo.dart';
/// Gets all available [Bill]s from storage
class GetAllBills implements UseCase<List<Bill>, NoParams> {
  /// [ProductRepository]
  final BillsRepository repo;

  ///
  GetAllBills(this.repo);

  @override
  Future<Either<Failure, List<Bill>>> call(NoParams params) =>
      repo.getAllBills();
}
