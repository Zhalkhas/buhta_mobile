import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecase.dart';
import '../entites/bill.dart';
import '../repos/bills_repo.dart';

/// Edits [Bill] instance in storage
class EditBill implements UseCase<void, EditBillParams> {
  /// [BillsRepository]
  final BillsRepository repo;

  ///
  EditBill(this.repo);

  @override
  Future<Either<Failure, void>> call(EditBillParams params) async =>
      Left(await repo.editBillStatus(params.bill));
}

/// Parameters for [EditBill] calling
class EditBillParams {
  /// [Bill] which should be edited
  final Bill bill;

  ///
  EditBillParams(this.bill);
}
