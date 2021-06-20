import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entites/bill.dart';

/// Class manages [Bill] storage
abstract class BillsRepository {
  /// Return all available [Bill]s
  Future<Either<Failure, List<Bill>>> getAllBills();

  /// Edit [Bill.status] of [bill]
  Future<Failure> editBillStatus(Bill bill);
}
