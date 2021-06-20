import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../../domain/entites/bill.dart';
import '../../domain/repos/bills_repo.dart';
import '../datasources/bill_local_datasource.dart';
import '../models/bill_model.dart';

/// Implementation of [BillsRepository]
class BillsRepositoryImpl implements BillsRepository {
  /// Provider of [BillModel] from local [Hive] db
  final BillLocalDataSource localSource;

  ///
  BillsRepositoryImpl(this.localSource);

  @override
  Future<Failure> editBillStatus(Bill bill) async {
    try {
      await localSource.editBillStatus(
          bill.id, _statusToModelStatus(bill.status));
      return null;
    } on Exception {
      return CacheFailure();
    }
  }

  BillModelStatus _statusToModelStatus(BillStatus status) {
    switch (status) {
      case BillStatus.canceled:
        return BillModelStatus.canceled;
      case BillStatus.waitingPayment:
        return BillModelStatus.waitingPayment;
      case BillStatus.paymentSuccess:
        return BillModelStatus.paymentSuccess;
      default:
        throw Exception('No such enum');
    }
  }

  @override
  Future<Either<Failure, List<Bill>>> getAllBills() async {
    try {
      final models = await localSource.getAllModels();
      final bills = <Bill>[];
      for (final model in models) {
        bills.add(Bill.fromModel(model));
      }
      return Right(bills);
    } on Exception {
      return Left(CacheFailure());
    }
  }
}
